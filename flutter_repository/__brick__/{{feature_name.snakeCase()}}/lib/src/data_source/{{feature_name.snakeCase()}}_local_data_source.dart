import 'package:{{feature_name.snakeCase()}}/src/data_source/{{feature_name.snakeCase()}}_data_source.dart';
import 'package:{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}.dart';
import 'package:{{feature_name.snakeCase()}}/src/data_source/data_source.dart';
import 'package:users_repository/src/model/users_repository.dart';

/// {@template {{feature_name.snakeCase()}}_local_data_source}
/// Implements the local data source for {{feature_name.pascalCase()}} objects.
/// This class should interact with local storage, such as SQLite, SharedPreferences, or files,
/// to retrieve and store {{feature_name.pascalCase()}} data.
/// {@endtemplate}
class {{feature_name.pascalCase()}}LocalDataSource implements {{feature_name.pascalCase()}}DataSource {
  @override
  Future<{{feature_name.pascalCase()}}> get(int id) async {
    // Creates a dummy {{feature_name.pascalCase()}} object. Replace with actual data retrieval logic.
    // Example: Retrieve data from a local database or cache.
    final {{feature_name.pascalCase()}} {{feature_name.camelCase()}} = {{feature_name.pascalCase()}}(id: '1');
    return {{feature_name.camelCase()}};
  }

  @override
  Future<void> add({{feature_name.pascalCase()}} {{feature_name.camelCase()}}) async {
    // Implement the logic to add the {{feature_name.pascalCase()}} model to a local data source.
    // Example: Insert data into a local database or save to a file.
  }

  // Optionally, implement other methods from the interface as needed.

  /// {@macro {{feature_name.snakeCase()}}_local_data_source}
}
