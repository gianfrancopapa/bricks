import 'package:{{feature_name.snakeCase()}}/{{feature_name.snakeCase()}}.dart';


/// {@template {{feature_name.snakeCase()}}_data_source}
/// Abstract class defining the interface for a data source of {{feature_name.pascalCase()}} objects.
/// This includes operations such as retrieving, adding, and potentially updating or deleting {{feature_name.pascalCase()}} instances.
/// {@endtemplate}
abstract class {{feature_name.pascalCase()}}DataSource {
  /// Retrieves a {{feature_name.pascalCase()}} object by its ID.
  /// 
  /// Throws a [NotFoundException] if no {{feature_name.pascalCase()}} is found with the given ID.
  Future<{{feature_name.pascalCase()}}> get(int id);

  /// Adds a new {{feature_name.pascalCase()}} object to the data source.
  /// 
  /// Returns the added {{feature_name.pascalCase()}} instance, often with an updated identifier provided by the data source.
  Future<void> add({{feature_name.pascalCase()}} {{feature_name.camelCase()}});

  // Add other methods like update{{feature_name.pascalCase()}}, delete{{feature_name.pascalCase()}}, etc., as needed.
  /// {@macro {{feature_name.snakeCase()}}_data_source}
  // Future<void> update{{feature_name.pascalCase()}}({{feature_name.pascalCase()}} {{feature_name.camelCase()}});
  
  /// {@macro {{feature_name.snakeCase()}}_data_source}
  // Future<void> delete{{feature_name.pascalCase()}}(int id);
}
