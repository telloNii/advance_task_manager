part of 'tasks_cubit.dart';

abstract class TasksState extends Equatable {
  const TasksState();
}

class TasksInitialState extends TasksState {
  @override
  List<Object> get props => [];
}

class AddStateLoading extends TasksState {
  @override
  List<Object> get props => [];
}

class AddStateSuccessful extends TasksState {
  @override
  List<Object> get props => [];
}

class DataLoading extends TasksState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class FetchDataSuccessful extends TasksState {
  List<TasksModel> tasks;

  FetchDataSuccessful({required this.tasks});

  @override
  List<Object> get props => [tasks];
}

class DeleteDataLoading extends TasksState {
  @override
  List<Object> get props => [];
}
