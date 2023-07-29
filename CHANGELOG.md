## 7.0.2 - 29/07/2023

* fix: maintain old `useBdayaViewController` behavior when in `factory` mode

## 7.0.1 - 25/07/2023

* fix: Prevent disposing controllers used in `useBdayaViewController` when they are being referenced by other views.

## 7.0.0 - 24/07/2023

* [Breaking] upgrade `go_router` to v10.0.0
* removed `tuple` dependency

## 6.0.0 - 03/07/2023

* [Breaking] upgrade `go_router` to v9.0.0
* [Breaking] upgrade `reactive_forms` to v16.0.0

## 5.0.0 - 03/05/2023

* [Breaking] upgrade `go_router` to v7.0.0

## 4.0.0 - 25/04/2023

* Change dart version constraint to be ">=2.19.0 <4.0.0"
* Change flutter version constraint to be ">=3.7.0"
* Added `BdayaMultiLoadableAreaWrapper` to handle listening to multiple loadable areas at once
* Added `withLoadableArea` to `BdayaIsLoadingMixin` to make it easier to create loadable areas
    * Before
        ```dart
        final area1 = BdayaIsLoadingMixin.createLoadableArea(name: "area 1");
        final area2 = BdayaIsLoadingMixin.createLoadableArea(name: "area 2", isLoading: true);
        ```
    * After:
        ```dart
        late final area1 = withLoadableArea(name: "area 1");
        late final area2 = withLoadableArea(name: "area 2", isLoading: true);
        ```

## 3.0.0 - 09/02/2023

* [Breaking] rename `LocalizedStrValueAccessor` to `BdayaLocalizedStrValueAccessor`
* [Breaking] rename `ReactiveLocalizedFormField` to `BdayaReactiveLocalizedFormField`
* [Breaking] rename `BdayaStreamHandlerMixin` to `BdayaDisposeHandlerMixin`
* [Breaking] rename `StreamToListenable` to `BdayaStreamToListenable`

## 2.0.0 - 31/12/2022

* Breaking changes

## 1.0.0 - 23/12/2022

* Breaking change to go_router v6.0.0 and injectable v2.1.0

## 0.0.6 - 16/12/2022

* Added `wrapWithArea` as an extension to `Future<T>` and `Stream<T>`

## 0.0.5 - 15/12/2022

* Added `beforeEachBuild` to `BdayaLifeCycleMixin`

## 0.0.4 - 10/12/2022

* Added `BdayaLoadableArea` to `BdayaIsLoadingMixin`

## 0.0.3 - 05/11/2022

* Upgrade to `go_router` v5.2.0

## 0.0.2 - 05/11/2022

* Rename public API to start with `Bdaya*`

## 0.0.1 - 05/11/2022

* Initial release
