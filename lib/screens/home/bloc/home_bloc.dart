
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
    if(event.taskId != null){
      taskSelectIndex = event.taskId ?? -1;
    }else{
      taskSelectIndex = -1;
    }
    emit(TaskLoaded(tasks));
  }

  void _onAddTask(AddTask event, Emitter<HomeState> emit) async {
    await dbHelper.insertTask(event.task).then((value) {
      emit(AddSuccess());
      add(LoadTasks(taskId: value));
    },);
  }

  void _onUpdateTask(UpdateTask event, Emitter<HomeState> emit) async {
    await dbHelper.updateTask(event.task).then((value) async {
      final tasks = await dbHelper.getAllTasks();
      taskSelectIndex = event.task.id ?? -1;
      emit(UpdateSuccess());
      emit(TaskLoaded(tasks));
    },);
  }

  void _onUpdateDoneTask(UpdateDoneTask event, Emitter<HomeState> emit) async {
    await dbHelper.updateDoneTask(event.task).then((value) async {
      final tasks = await dbHelper.getAllTasks();
      taskSelectIndex = event.task.id ?? -1;
      emit(UpdateSuccess());
      emit(TaskLoaded(tasks));
    },);
  }

  void _onDeleteTask(DeleteTask event, Emitter<HomeState> emit) async {
    await dbHelper.deleteTask(event.id).then((value) async {
      final tasks = await dbHelper.getAllTasks();
      taskSelectIndex =  -1;
      emit(DeleteSuccess());
      emit(TaskLoaded(tasks));
    },);
  }
}
