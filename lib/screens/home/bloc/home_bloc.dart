
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/task_model.dart';
import '../../../go_router/go_router.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState> {
  final DatabaseHelper dbHelper = DatabaseHelper();


  HomeBloc() : super(InitState()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    final tasks = await dbHelper.getTasks();
    emit(TaskLoaded(tasks));
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) async {
    await dbHelper.insertTask(event.task);
    add(LoadTasks());
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    await dbHelper.updateTask(event.task);
    add(LoadTasks());
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    await dbHelper.deleteTask(event.id);
    add(LoadTasks());
  }
}

