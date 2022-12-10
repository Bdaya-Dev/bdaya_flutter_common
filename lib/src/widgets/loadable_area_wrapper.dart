import 'package:bdaya_flutter_common/src/helpers/controller/is_loading_mixin.dart';
import 'package:bdaya_flutter_common/src/models/loadable_area.dart';
import 'package:flutter/material.dart';

typedef LoadableeAreaCustomBuilderFunction = Widget Function(BuildContext context, BdayaLoadableArea area);
typedef LoadableAreaErrorBuilderFunction = Widget Function(BuildContext context, String displayName, Object error, StackTrace? st);
typedef LoadableAreaLoadingBuilderFunction = Widget Function(BuildContext context, String displayName);

LoadableAreaLoadingBuilderFunction defaultLoadableAreaIsLoadingBuilder = (context, displayName) => const CircularProgressIndicator.adaptive();
LoadableAreaErrorBuilderFunction defaultLoadableAreaErrorBuilder = (context, displayName, error, st) => Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Area: $displayName'),
        const SizedBox(height: 2),
        ErrorWidget(error),
      ],
    );

class LoadableAreaWrapper extends StatelessWidget {
  const LoadableAreaWrapper({
    super.key,
    required this.area,
    required WidgetBuilder this.builder,
    this.isLoadingBuilder,
    this.errorBuilder,
    this.displayErrors = false,
  }) : customBuilder = null;

  const LoadableAreaWrapper.custom({
    super.key,
    required this.area,
    required LoadableeAreaCustomBuilderFunction this.customBuilder,
  })  : builder = null,
        isLoadingBuilder = null,
        errorBuilder = null,
        displayErrors = false;

  final bool displayErrors;
  final BdayaRxLoadableArea area;
  final LoadableeAreaCustomBuilderFunction? customBuilder;
  final WidgetBuilder? builder;
  final LoadableAreaLoadingBuilderFunction? isLoadingBuilder;
  final LoadableAreaErrorBuilderFunction? errorBuilder;
  @override
  Widget build(BuildContext context) {
    final value = area.of(context);
    if (customBuilder != null) {
      return customBuilder!(context, value);
    }
    if (value.isLoading) {
      return (isLoadingBuilder ?? defaultLoadableAreaIsLoadingBuilder)(context, value.displayName);
    }
    final error = value.error;
    if (error != null && displayErrors) {
      return (errorBuilder ?? defaultLoadableAreaErrorBuilder)(context, value.displayName, error, value.st);
    }
    return builder!(context);
  }
}
