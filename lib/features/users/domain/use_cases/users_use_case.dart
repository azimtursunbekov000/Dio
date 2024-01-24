
import 'package:lessons43/features/users/data/models/user_model.dart';
import 'package:lessons43/features/users/domain/repositories/users_repository.dart';

class UsersUseCase {
  final UsersRepository usersRepository;

  const UsersUseCase({required this.usersRepository});

  Future<List<UsersModel>> getAllUsers() async {
    return await usersRepository.detAllUsers();
  }

  Future<UsersModel> getUserDetail ({required int id})async {
    return await usersRepository.getUserDetail(id: id);
  }



}