import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itbeesolutionstest/config/task_model.dart';
import 'package:itbeesolutionstest/screens/home/bloc/home_bloc.dart';
import 'package:itbeesolutionstest/utils/color_constant.dart';
import 'package:itbeesolutionstest/utils/size_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    _bloc.add(LoadTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is TaskLoaded) {
          return Scaffold(
            appBar: AppBar(title: Text('Danh sách công việc')),
            body: ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return Container(
                  color: ColorConstant.welcomeBack,
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Expanded(child: Column(children: [Text(task.title)])),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context.read<HomeBloc>().add(DeleteTask(task.id!));
                        },
                      ),
                    ],
                  ),
                );

                // ListTile(
                //   title: Text(task.title),
                //   subtitle: Text(task.description ?? ''),
                //   trailing: IconButton(
                //     icon: Icon(Icons.delete, color: Colors.red),
                //     onPressed: () {
                //       context.read<HomeBloc>().add(DeleteTask(task.id!));
                //     },
                //   ),
                //   onTap: () {
                //     // context.read<TaskBloc>().add(UpdateTask(
                //     //   //task.copyWith(status: task.status == 0 ? 1 : 0),
                //     // ));
                //   },
                // );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final newTask = TaskModel(
                  title: 'Công việc mới',
                  description: 'Mô tả công việc',
                  status: 0,
                  dueDate: '2025-03-21',
                  createdAt: DateTime.now().toIso8601String(),
                  updatedAt: DateTime.now().toIso8601String(),
                );
                _bloc.add(AddTask(newTask));
              },
              child: Icon(Icons.add),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
