part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadTasks extends HomeEvent {}

class AddTest extends HomeEvent {}

class AddTask extends HomeEvent {
  final TaskModel task;
  AddTask(this.task);
}

class UpdateTask extends HomeEvent {
  final TaskModel task;
  UpdateTask(this.task);
}

class DeleteTask extends HomeEvent {
  final int id;
  DeleteTask(this.id);
}