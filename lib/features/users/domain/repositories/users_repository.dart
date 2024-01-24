import 'package:lessons43/features/users/data/models/user_model.dart';

abstract class UsersRepository {


  /// RU: Получение всех пользователей
  ///
  /// EN: Getting all users
  Future<List<UsersModel>> detAllUsers();

  /// RU: Получение детальной информации по айди пользователя
  ///
  /// EN: Getting user detail user by id
  Future<UsersModel> getUserDetail ({required int id});

}