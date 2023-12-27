# go router setup

A mason brick to create the initial structure for go router.

## Prerequisites

Flutter app created and ui package installed (optional)

```
very_good create flutter_app my_app
```

## Usage 🚀

```
mason make go_router_setup
```

Note: for better usage the output directory should be inside the lib folder.

## Variables ✨

| variable       | description               | default | type     |
| -------------- | ------------------------- | ------- | -------- |
| `package_name` | name of the package       | app     | `string` |
| `short_name`   | short name of the package | ap      | `string` |

## Output 📦

```
├── app
│   ├── extensions
│   ├── router
│   │   └── app_router.dart
│   ├── view
│   │   └── app.dart
│   └── app.dart
└── ...
```

[go_router]: https://pub.dev/packages/go_router
