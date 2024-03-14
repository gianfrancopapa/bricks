import '../model/{{feature_name}}.dart';
import '../data_source/{{feature_name}}_data_source.dart';

// Implements the local data source for {{feature_name.pascalCase()}}.
class {{feature_name.pascalCase()}}LocalDataSource implements {{feature_name.pascalCase()}}DataSource {
  @override
  Future<{{feature_name.pascalCase()}}> get(int id) async {
    // Creates a dummy {{feature_name.pascalCase()}} object. Replace with actual data retrieval logic.
    final {{feature_name.pascalCase()}} {{feature_name.camelCase()}} = {{feature_name.pascalCase()}}(id: '1',);
    return {{feature_name.camelCase()}};
  }

  @override
  Future<void> add({{feature_name.pascalCase()}} {{feature_name.camelCase()}}) async {
    // Implement the logic to add the model to a local data source.
  }
}
