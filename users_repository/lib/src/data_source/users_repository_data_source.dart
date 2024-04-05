import 'package:users_repository/users_repository.dart';


/// {@template users_repository_data_source}
/// Abstract class defining the interface for a data source of UsersRepository objects.
/// This includes operations such as retrieving, adding, and potentially updating or deleting UsersRepository instances.
/// {@endtemplate}
abstract class UsersRepositoryDataSource {
  /// Retrieves a UsersRepository object by its ID.
  /// 
  /// Throws a [NotFoundException] if no UsersRepository is found with the given ID.
  Future<UsersRepository> get(int id);

  /// Adds a new UsersRepository object to the data source.
  /// 
  /// Returns the added UsersRepository instance, often with an updated identifier provided by the data source.
  Future<void> add(UsersRepository usersRepository);

  // Add other methods like updateUsersRepository, deleteUsersRepository, etc., as needed.
  /// {@macro users_repository_data_source}
  // Future<void> updateUsersRepository(UsersRepository usersRepository);
  
  /// {@macro users_repository_data_source}
  // Future<void> deleteUsersRepository(int id);
}
