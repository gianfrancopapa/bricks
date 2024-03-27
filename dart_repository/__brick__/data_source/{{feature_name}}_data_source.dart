import '../model/{{feature_name}}.dart';

// Abstract class for the {{feature_name.pascalCase()}} data source.
abstract class {{feature_name.pascalCase()}}DataSource {
  // Method to retrieve a {{feature_name.pascalCase()}} by ID.
  Future<{{feature_name.pascalCase()}}> get(int id);

  // Method to add a new {{feature_name.pascalCase()}}.
  Future<void> add({{feature_name.pascalCase()}} {{feature_name.camelCase()}});

  // Other methods like update{{model_name.pascalCase}}, delete{{model_name.pascalCase}}, etc.
}
