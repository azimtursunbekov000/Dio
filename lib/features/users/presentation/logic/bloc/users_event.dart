part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class GetAllUsersEvent extends UsersEvent {}

class GetUserDetailEvent extends UsersEvent {
  final int id;

  GetUserDetailEvent({required this.id});
}
