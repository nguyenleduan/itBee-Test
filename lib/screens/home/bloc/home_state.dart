part of 'home_bloc.dart';

abstract class HomeState {}

class TaskInitial extends HomeState {}

class TaskLoaded extends HomeState {
  final List<TaskModel> tasks;
  TaskLoaded(this.tasks);
}