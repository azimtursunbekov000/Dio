import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessons43/features/users/data/repositories/users_repository_impl.dart';
import 'package:lessons43/features/users/domain/use_cases/users_use_case.dart';
import 'package:lessons43/features/users/presentation/logic/bloc/users_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UsersBloc usersBloc = UsersBloc(
    usersUseCase: UsersUseCase(
      usersRepository: UsersRepositoryImpl(),
    ),
  );
  @override
  void initState() {
    usersBloc.add(GetAllUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextAllUsers"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: BlocConsumer<UsersBloc, UsersState>(
          bloc: usersBloc,
          listener: (context, state) {
            if (state is UsersErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.message.toString()),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return CircularProgressIndicator();
            }
            if (state is UsersErrorState) {
              return ElevatedButton(
                onPressed: () {},
                child: Text('повторить'),
              );
            }
            if (state is UsersLoadedState) {
              return ListView.separated(
                  itemCount: state.userModelList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Text(state.userModelList[index].name ?? ""),
                          Text(state.userModelList[index].email ?? ''),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 16);
                  });
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
