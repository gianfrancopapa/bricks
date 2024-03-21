## {{project_name.titleCase()}} UI package

{{project_name.titleCase()}} UI package containing a general design system.

#### Output 📦

```
├── {{project_name.snakeCase()}}_ui
│   ├── assets
│   │  ├── fonts
│   │  ├── icons
│   │  ├── images
│   ├── gallery
│   ├── lib
│   │   └── src
│   │       ├── colors
│   │       ├── icons
│   │       │      ├── {{project_name.snakeCase()}}_icons_dark.dart
│   │       │      ├── {{project_name.snakeCase()}}_icons_light.dart
│   │       │      └── {{project_name.snakeCase()}}_icons.dart 
│   │       ├── spacing
│   │       ├── theme
│   │       ├── typography
│   │       └── widgets
│   │             ├── {{project_name.snakeCase()}}_app_bar.dart
│   │             ├── {{project_name.snakeCase()}}_outlined_button.dart
│   │             └── {{project_name.snakeCase()}}_text_field.dart 
│   ├── {{project_name.snakeCase()}}_ui.dart
│   ├── .gitignore
│   ├── analysis_options.yaml
│   └── pubspec.yaml
└── ...
```

#### Colors 

The colors and their names come from Material 3 flutter. They should be modified to meet the project colors requirements.

#### Spacing 

The spacings and their names are general examples, the user can add other necessary spacing.

#### Theme

A theme is a collection of attributes that's applied to an entire project not just an individual view. When you apply the theme, every view in the project applies each of the theme's attributes that it supports. The theme here may be dark (black background) or light (white background). 

#### Typography

In this project, the only fonts assets being used in this case are `NotoSansDisplay-Regular` and `NotoSansDisplay-Semibold`. 

#### Widgets

In the output of the brick, there are a textfield, an outline button and an appbar. All of which extend an example. The developer can delete these and add specific project widgets extending the widgets that flutter already provides or that they reflect the identity of the project.

#### Adding new assets

Everytime the user adds a new asset (such as icons, images, fonts, gifs) he must:

```dart
  cd {{project_name.snakeCase()}}_ui
  flutter pub get
  flutter pub run build_runner build 
``` 

The `assets.gen.dart`, `fonts.gen.dart` will update.  

#### Assets usage Example

The correct way to use the assets, such as icons, gifs, pictures after running `flutter pub run build_runner build` inside the package directory is:

1) Inside `{{project_name.snakeCase()}}_icons.dart`:


```dart
  SvgPicture backIcon({double? size, Color? color}) {
    return Assets.icons.backIcon.svg(
      color: color,
      height: size ?? 14,
      width: size ?? 14,
    );
  }
```
2) In `{{project_name.snakeCase()}}_icons_light.dart` add the icon with its color respectively of the theme. 


```dart
@override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? ProjectNameColors.black,
      size: size ?? 14,
    );
  }
```

3) In `{{project_name.snakeCase()}}_icons_dark.dart` add the icon with its color respectively of the theme. 


```dart
@override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? AppColors.white,
      size: size ?? 14,
    );
  }
```

4) Set the size and color of the icon when using it in the project UI:

```dart
Theme.of(context).icons.backIcon(
        size: 30,
      ),
```

#### Gallery

The gallery shows different visual examples of some items from the ui package as well as some to use the project theme properly.

The theme can be changed in the gallery by clicking on the icon of the moon/sun at the top. The idea is that the developer can see the difference in colors, buttons and other widgets according to the theme chosen between dark and light.