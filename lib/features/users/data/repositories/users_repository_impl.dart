import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lessons43/features/users/data/models/user_model.dart';
import 'package:lessons43/features/users/domain/repositories/users_repository.dart';
import 'package:lessons43/internal/helpers/api_requester.dart';
import 'package:lessons43/internal/helpers/catch_exception.dart';

class UsersRepositoryImpl implements UsersRepository {
  ApiRequester apiRequester = ApiRequester();

  @override
  Future<List<UsersModel>> detAllUsers() async {
    try {
      Response response = await apiRequester.toGet('users');

      log('getAllUsers response statusCode == ${response.statusCode}');
      log('getAllUsers response data == ${response.data}');

      if (response.statusCode == 200) {
        return response.data
            .map<UsersModel>((value) => UsersModel.fromJson(value))
            .toList();
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  @override
  Future<UsersModel> getUserDetail({required int id}) async {
    try {
      Response response = await apiRequester.toGet('users/$id');

      log('getUserDetail response statusCode == ${response.statusCode}');
      log('getUserDetail response data == ${response.data}');

      if (response.statusCode == 200) {
        return UsersModel.fromJson(response.data);
      }
      throw response;
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}
