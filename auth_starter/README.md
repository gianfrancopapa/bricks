# auth_starter

A mason brick to create a login, sign-up basic UIs, with Formz validation.

Requirements:
- formz
- equatable
- flutter_bloc

Notes: 
- This brick will replace existing l10n folder, and authentication features if available.
- Best used at the beginning of a project. 
- It can only be executed in lib folder.


## Usage 🚀

```
mason make auth_starter
```

## Variables ✨

| variable       | description               | default | type     |
| -------------- | ------------------------- | ------- | -------- |
| `package_name` | name of the package       | app     | `string` |

## Output 📦

```
├── authentication
│   ├── login
│   │     ├──bloc
│   │     │  ├── login_bloc.dart
│   │     │  ├── login_event.dart
│   │     │  └── login_state.dart
│   │     ├──view
│   │     │  ├── login_page.dart
│   │     │  ├── login_view.dart
│   │     │  └── view.dart
│   │     └── login.dart
│   ├── sign_up
│   │     ├──bloc
│   │     │  ├── sign_up_bloc.dart
│   │     │  ├── sign_up_event.dart
│   │     │  └── sign_up_state.dart
│   │     ├──view
│   │     │  ├── sign_up_page.dart
│   │     │  ├── sign_up_view.dart
│   │     │  └── view.dart
│   │     └── sign_up.dart
├── l10n
│   ├── arb
│   │  └── app_en.arb
│   └── l10n.dart
└── ...
```

[formz]: https://pub.dev/packages/formz
[equatable]: https://pub.dev/packages/equatable
[flutter_bloc]: https://pub.dev/packages/flutter_bloc