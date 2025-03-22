
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/database_helper.dart';

import 'package:itbeesolutionstest/config/task_model.dart';

import '../../../service/notification_service.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  int taskSelectIndex = -1;
  HomeBloc() : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<UpdateDoneTask>(_onUpdateDoneTask);
  }
  void _onLoadTasks(LoadTasks event, Emitter<HomeState> emit) async {
    final tasks = await dbHelper.getAllTasks();
    taskSelectIndex = -1;
    emit(TaskLoaded(tasks));
  }

  void _onAddTask(AddTask event, Emitter<HomeState> emit) async {
    await dbHelper.insertTask(event.task) ;
    taskSelectIndex = -1;
    add(LoadTasks());
  }

  void _onUpdateTask(UpdateTask event, Emitter<HomeState> emit) async {
    await dbHelper.updateTask(event.task).then((value) async {
      final tasks = await dbHelper.getAllTasks();
      taskSelectIndex = event.task.id ?? -1;
      emit(TaskLoaded(tasks));
    },);
  }

  void _onUpdateDoneTask(UpdateDoneTask event, Emitter<HomeState> emit) async {
    await dbHelper.updateDoneTask(event.task).then((value) async {
      final tasks = await dbHelper.getAllTasks();
      taskSelectIndex = event.task.id ?? -1;
      emit(TaskLoaded(tasks));
    },);
  }

  void _onDeleteTask(DeleteTask event, Emitter<HomeState> emit) async {
    add(LoadTasks());
    await dbHelper.deleteTask(event.id).then((value) async {
      final tasks = await dbHelper.getAllTasks();
      taskSelectIndex =  -1;
      emit(TaskLoaded(tasks));
    },);
  }
}
