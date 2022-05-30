# feature route bloc

A mason brick to create a new feature using BLoC and Route.

## Prerequisites

Installed version of [equatable] and [flutter_bloc] >= 8.0.0

## Usage 🚀

```
mason make feature_route_bloc --feature_name login --package_name app
```

Note: for better usage the output directory should be inside the lib folder.

## Variables ✨

| variable           | description                  | default | type      |
| ------------------ | ---------------------------- | ------- | --------- |
| `feature_name`     | name of the feature          | login   | `string`  |
| `package_name`     | name of the package          | app     | `string`  |
| `add_dependencies` | add flutter_bloc & equatable | app     | `boolean` |

## Output 📦

```
├── login
│   ├── bloc
│   │   ├── login_bloc.dart
│   │   ├── login_event.dart
│   │   └── login_state.dart
│   ├── view
│   │   ├── login_route.dart
│   │   └── login_view.dart
│   └── login.dart
└── ...
```

[flutter_bloc]: https://pub.dev/packages/flutter_bloc
[equatable]: https://pub.dev/packages/equatable
