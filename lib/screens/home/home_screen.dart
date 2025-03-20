import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeBloc _bloc = HomeBloc();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách công việc')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is TaskLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<HomeBloc>().add(DeleteTask(task.id!));
                    },
                  ),
                  onTap: () {
                    context.read<TaskBloc>().add(UpdateTask(
                      task.copyWith(status: task.status == 0 ? 1 : 0),
                    ));
                  },
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTask = Task(
            title: 'Công việc mới',
            description: 'Mô tả công việc',
            status: 0,
            dueDate: '2025-03-21',
            createdAt: DateTime.now().toIso8601String(),
            updatedAt: DateTime.now().toIso8601String(),
          );
          context.read<TaskBloc>().add(AddTask(newTask));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
