import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons43/features/users/data/repositories/users_repository_impl.dart';
import 'package:lessons43/features/users/domain/use_cases/users_use_case.dart';
import 'package:lessons43/features/users/presentation/logic/bloc/users_bloc.dart';

class UsersDetailScreen extends StatefulWidget {
  final int id;

  const UsersDetailScreen({super.key, required this.id});

  @override
  State<UsersDetailScreen> createState() => _UsersDetailScreenState();
}

class _UsersDetailScreenState extends State<UsersDetailScreen> {
  final UsersBloc usersBloc = UsersBloc(
    usersUseCase: UsersUseCase(
      usersRepository: UsersRepositoryImpl(),
    ),
  );
  @override
  void initState() {
    usersBloc.add(GetUserDetailEvent(id: widget.id));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("UserDetail"),
      ),
      body: Center(
        child: BlocConsumer<UsersBloc, UsersState>(
          bloc: usersBloc,
          listener: (context, state) {
            if (state is UsersErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error.message.toString(),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if(state is UsersLoadingState){
              return CircularProgressIndicator();
            }
            if (state is UsersDetailLoadedState) {
              return ListView(
                children: [
                  Container(
                    color: Colors.lightGreenAccent,
                    child: Column(
                      children: [
                        Text(state.userModel.name ?? "" ),
                        Text(state.userModel.id.toString()),
                      ],
                    ),
                  ),
                ],
              );
            }
            return SizedBox(height: 16);
          },
        ),
      ),
    );
  }
}
