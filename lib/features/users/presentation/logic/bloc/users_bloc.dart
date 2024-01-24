import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lessons43/internal/helpers/catch_exception.dart';
import 'package:meta/meta.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/use_cases/users_use_case.dart';

part 'users_event.dart';

part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersUseCase usersUseCase;

  UsersBloc({required this.usersUseCase}) : super(UsersInitialState()) {
    on<GetAllUsersEvent>((event, emit) async {
      emit(UsersLoadingState());

      try {
        final List<UsersModel> usersModelList =
            await usersUseCase.getAllUsers();

        emit(UsersLoadedState(userModelList: usersModelList));
      } catch (e) {
        print(e);
        emit(UsersErrorState(error: CatchException.convertException(e)));
      }
    });

    on<GetUserDetailEvent>((event, emit) async {
      emit(UsersLoadingState());

      try {
        final UsersModel userModel =
            await usersUseCase.getUserDetail(id: event.id);

        emit(UsersDetailLoadedState(userModel: userModel));
      } catch (e) {
        emit(UsersErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
