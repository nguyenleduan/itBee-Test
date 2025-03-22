
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/database_helper.dart';

import 'package:itbeesolutionstest/config/task_model.dart';

import '../../../service/notification_service.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  HomeBloc() : super(TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }
  void  _addTaskPushNotyTest(AddTest event, Emitter<HomeState> emit) async {
    await NotificationService.scheduleNotification(
      31,
      "Nhắc nhở công việc",
      'atest',
        DateTime.now().add(Duration(minutes: 2)),
    );
}
  void _onLoadTasks(LoadTasks event, Emitter<HomeState> emit) async {
    final tasks = await dbHelper.getAllTasks();
    emit(TaskLoaded(tasks));
  }

  void _onAddTask(AddTask event, Emitter<HomeState> emit) async {
    await dbHelper.insertTask(event.task);
    add(LoadTasks());
  }

  void _onUpdateTask(UpdateTask event, Emitter<HomeState> emit) async {
    await dbHelper.updateTask(event.task);
    add(LoadTasks());
  }

  void _onDeleteTask(DeleteTask event, Emitter<HomeState> emit) async {
    await dbHelper.deleteTask(event.id);
    add(LoadTasks());
  }
}
