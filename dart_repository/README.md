# Dart Repository Brick

## Description

This Mason brick generates a code structure for managing data access in Dart and Flutter applications. It provides a solid foundation for implementing the Repository design pattern, with support for custom models, data sources, and repositories.

## Features

- Automatically generates classes for models, data sources, and repositories.
- Customizable for any data model.
- Support for basic CRUD operations.

## Usage

Ensure you have Mason installed and configured in your development environment. For more information on installing Mason, visit [Mason Documentation](https://github.com/felangel/mason).

### Step 1: Add the Brick

To use the `dart_repository` brick, first add it to your project:

```bash
mason add -g dart_repository --git-url URL_OF_YOUR_BRICK_REPO
```

### Step 2: Run the Brick

Navigate to the directory where you want to generate the code and run:

```bash
mason make dart_repository
```

You will be prompted to enter names for your model, data source, local data source, and repository. These names will be used to customize the generated classes.

## Variables

- `feature_name`: The name of your feature. This name is used to generate various components like models, data sources, and repositories.

## Generated File Structure

The brick will generate the following file structure:

lib/
├── {{feature_name}}
│ └── {{feature_name}}.dart
├── {{feature_name}}\_data_source
│ └── {{feature_name}}\_data_source.dart
├── {{feature_name}}\_local_data_source
│ └── {{feature_name}}\_local_data_source.dart
└── {{feature_name}}\_repository
└── {{feature_name}}\_repository.dart

This structure organizes the model, data source, local data source, and repository into separate directories and files based on the provided feature name.
