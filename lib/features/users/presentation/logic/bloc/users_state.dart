part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UsersModel> userModelList;

  UsersLoadedState({required this.userModelList});
}

class UsersDetailLoadedState extends UsersState {
  final UsersModel userModel;

  UsersDetailLoadedState({required this.userModel});
}

class UsersErrorState extends UsersState {
  final CatchException error;

  UsersErrorState({required this.error});
}
