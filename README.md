![bdaya-dev.com](docs/media/logo.jpg)

We made this library to combine and standarize the common code we use in our projects into a single package.

Feel free to use it, but on your own risk.

WARNING: This package may have drastic breaking changes with no migration guides.

# Features

## View-Controller architecture with helper classes
* `BdayaLoggableMixin`: provides a unique `logger`
* `BdayaLifeCycleMixin`: provides life cycle management for controllers using
  * `beforeRender`: same as `initState` for stateful widgets
  * `afterRender`: gets called after a single frame has been rendered, which is useful for accessing states in `GlobalKey`s
  * `onDispose`: same as `dispose` for stateful widgets
* `BdayaIsLoadingMixin`: exposes reactive `isLoading` 
* `BdayaStreamHandlerMixin`: useful for managing `Stream` and `Listenable` subscriptions
## Hooks using `flutter_hooks` 
* `useViewController`: registers a `lazySingleton` controller, and if it uses `BdayaLifeCycleMixin`, fires the related events
## Routing helpers using `go_router`
* `RouterListenableMixin` listens to `GoRouter` for changes to the current route, and notifies the controller about them

## Combined controllers for all of the above
* `BdayaCombinedController` suitable for any widget, mixes 
  1. `BdayaLoggableMixin`
  2. `BdayaLifeCycleMixin`
  3. `BdayaIsLoadingMixin`
  4. `BdayaStreamHandlerMixin`
* `BdayaCombinedRouteController` suitable for routable pages, mixes
  1. `BdayaCombinedController`
  2. `RouterListenableMixin`

## Localization helpers
* `ReactiveLocalizedFormField` which operates on a `FormControl<LocalizedStr>` to support multi-formfield inputs of localization
* 
## Usage

Check the `/example` folder for a complete example of the architecture we use