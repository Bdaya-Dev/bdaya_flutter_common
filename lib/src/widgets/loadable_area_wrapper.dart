import 'package:bdaya_flutter_common/src/helpers/controller/is_loading_mixin.dart';
import 'package:bdaya_flutter_common/src/models/loadable_area.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef BdayaLoadableAreaCustomBuilderFunction = Widget Function(
    BuildContext context, BdayaLoadableArea area);
typedef BdayaLoadableAreaErrorBuilderFunction = Widget Function(
    BuildContext context, String displayName, Object error, StackTrace? st);
typedef BdayaLoadableAreaLoadingBuilderFunction = Widget Function(
    BuildContext context, String displayName);

typedef BdayaMultiLoadableAreaCustomBuilderFunction = Widget Function(
    BuildContext context, List<BdayaLoadableArea> area);

BdayaLoadableAreaLoadingBuilderFunction
    bdayaDefaultLoadableAreaIsLoadingBuilder =
    (context, displayName) => const CircularProgressIndicator.adaptive();
BdayaLoadableAreaErrorBuilderFunction bdayaDefaultLoadableAreaErrorBuilder =
    (context, displayName, error, st) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Area: $displayName'),
            const SizedBox(height: 2),
            ErrorWidget(error),
          ],
        );

class BdayaLoadableAreaWrapper extends StatelessWidget {
  const BdayaLoadableAreaWrapper({
    super.key,
    required this.area,
    required WidgetBuilder this.builder,
    this.isLoadingBuilder,
    this.errorBuilder,
    this.displayErrors = false,
  }) : customBuilder = null;

  const BdayaLoadableAreaWrapper.custom({
    super.key,
    required this.area,
    required BdayaLoadableAreaCustomBuilderFunction this.customBuilder,
  })  : builder = null,
        isLoadingBuilder = null,
        errorBuilder = null,
        displayErrors = false;

  final bool displayErrors;
  final BdayaRxLoadableArea area;
  final BdayaLoadableAreaCustomBuilderFunction? customBuilder;
  final WidgetBuilder? builder;
  final BdayaLoadableAreaLoadingBuilderFunction? isLoadingBuilder;
  final BdayaLoadableAreaErrorBuilderFunction? errorBuilder;
  @override
  Widget build(BuildContext context) {
    final value = area.of(context);
    if (customBuilder != null) {
      return customBuilder!(context, value);
    }
    if (value.isLoading) {
      return (isLoadingBuilder ?? bdayaDefaultLoadableAreaIsLoadingBuilder)(
          context, value.displayName);
    }
    final error = value.error;
    if (error != null && displayErrors) {
      return (errorBuilder ?? bdayaDefaultLoadableAreaErrorBuilder)(
          context, value.displayName, error, value.st);
    }
    return builder!(context);
  }
}

class BdayaMultiLoadableAreaWrapper extends StatelessWidget {
  const BdayaMultiLoadableAreaWrapper({
    super.key,
    required this.areas,
    required WidgetBuilder this.builder,
    this.isLoadingBuilder,
    this.errorBuilder,
    this.displayErrors = false,
  }) : customBuilder = null;

  const BdayaMultiLoadableAreaWrapper.custom({
    super.key,
    required this.areas,
    required BdayaMultiLoadableAreaCustomBuilderFunction this.customBuilder,
  })  : builder = null,
        isLoadingBuilder = null,
        errorBuilder = null,
        displayErrors = false;

  final bool displayErrors;
  final List<BdayaRxLoadableArea> areas;
  final BdayaMultiLoadableAreaCustomBuilderFunction? customBuilder;
  final WidgetBuilder? builder;
  final BdayaLoadableAreaLoadingBuilderFunction? isLoadingBuilder;
  final BdayaLoadableAreaErrorBuilderFunction? errorBuilder;
  @override
  Widget build(BuildContext context) {
    final values = areas.map((e) => e.of(context)).toList();
    if (customBuilder != null) {
      return customBuilder!(context, values);
    }
    final firstLoading =
        values.firstWhereOrNull((element) => element.isLoading);
    if (firstLoading != null) {
      return (isLoadingBuilder ?? bdayaDefaultLoadableAreaIsLoadingBuilder)(
        context,
        firstLoading.displayName,
      );
    }

    if (displayErrors) {
      final firstError =
          values.firstWhereOrNull((element) => element.error != null);
      if (firstError != null) {
        return (errorBuilder ?? bdayaDefaultLoadableAreaErrorBuilder)(
          context,
          firstError.displayName,
          firstError.error!,
          firstError.st,
        );
      }
    }
    return builder!(context);
  }
}
