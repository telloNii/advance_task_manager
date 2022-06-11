import 'package:advance_task_manager/model/tasks.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitialState());
  List<TasksModel> tasksListInMemory = [];

  Future<void> addTask(
      {required String title,
      required String note,
      required DateTime date,
      required String startTime,
      required String endTime,
      required int remind,
      required String repeat,
      required Color color}) async {
    emit(DataLoading());
    tasksListInMemory.add(TasksModel(
      id: 1,
      title: title,
      note: note,
      date: date,
      startTime: startTime,
      endTime: endTime,
      remind: remind,
      repeat: repeat,
      color: color,
      isCompleted: 0,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(AddStateSuccessful());
    emit(FetchDataSuccessful(tasks: tasksListInMemory));
  }

  Future<void> fetchTasks() async {
    emit(DataLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(FetchDataSuccessful(tasks: tasksListInMemory));
  }

  Future<void> deleteTasks({required int index}) async {
    emit(DataLoading());
    tasksListInMemory.removeAt(index);
    await Future.delayed(const Duration(seconds: 1));
    emit(FetchDataSuccessful(tasks: tasksListInMemory));
  }
}
