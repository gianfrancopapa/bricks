// Import necessary files from the feature and its data source.
import '../model/{{feature_name}}.dart';
import '../data_source/{{feature_name}}_data_source.dart';

// Defines the {{feature_name.pascalCase()}}Repository class.
class {{feature_name.pascalCase()}}Repository {
  // Initializes the repository with a data source.
  {{feature_name.pascalCase()}}Repository(this.dataSource);

  // Variable to store the data source.
  final {{feature_name.pascalCase()}}DataSource dataSource;

  // Method to get an item by ID.
  Future<{{feature_name.pascalCase()}}> get(int id) async {
    return dataSource.get(id);
  }

  // Method to add a new item.
  Future<void> add({{feature_name.pascalCase()}} {{feature_name.camelCase()}}) async {
    return dataSource.add({{feature_name.camelCase()}});
  }
}
