# Mason bricks 🧱

[Mason][mason_link] reusable bricks.

## Bricks ✨

| name                                       | description                                                                 |
| ------------------------------------------ | --------------------------------------------------------------------------- |
| [`dart_package`][dart_package]             | Create a new Dart package with linter rules and basic structure             |
| [`feature_page_bloc`][feature_page_bloc]   | Create a new feature using BLoC and Page                                    |
| [`feature_route_bloc`][feature_route_bloc] | Create a new feature using BLoC and Route                                   |
| [`flutter_package`][flutter_package]       | Create a new Flutter package with linter rules and basic structure          |
| [`model_json`][model_json]                 | Create a basic model class using json serializable                          |
| [`rest_frog`][rest_frog]                   | Create REST endpoints for a give route in your Dart Frog project            |
| [`ui_package`][ui_package]                 | Create a new UI package in Flutter containing the design system of your app |

## Getting started 🚀

### Adding a brick 🧱️

To add a brick, use any of the following commands:

```sh
# add from git url
mason add <BRICK_NAME> --git-url https://github.com/gianfrancopapa/bricks --git-path path/to/<BRICK_NAME>

# add from git url (global)
mason add -g <BRICK_NAME> --git-url https://github.com/gianfrancopapa/bricks --git-path path/to/<BRICK_NAME>

# example to add flutter_package brick
mason add -g flutter_package --git-url https://github.com/gianfrancopapa/bricks --git-path flutter_package/
```

_Note: Be sure to replace `<BRICK_NAME>` with one of the bricks mentioned_

[//]: # "links."
[mason_link]: https://pub.dev/packages/mason
[dart_package]: https://github.com/gianfrancopapa/bricks/tree/main/dart_package
[feature_page_bloc]: https://github.com/gianfrancopapa/bricks/tree/main/feature_page_bloc
[feature_route_bloc]: https://brickhub.dev/bricks/feature_route_bloc
[flutter_package]: https://github.com/gianfrancopapa/bricks/tree/main/flutter_package
[model_json]: https://github.com/gianfrancopapa/bricks/tree/main/model_json
[rest_frog]: https://brickhub.dev/bricks/rest_frog
[ui_package]: https://brickhub.dev/bricks/ui_package

mason add dart_package --git-url https://github.com/gianfrancopapa/bricks --git-path dart_package