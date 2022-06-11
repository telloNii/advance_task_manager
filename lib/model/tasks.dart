import 'package:flutter/material.dart';

class TasksModel {
  TasksModel({
    required this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remind,
    required this.repeat,
    required this.color,
    required this.isCompleted,
  });
  late int id;
  late final String title;
  late final String note;
  late final DateTime date;
  late final String startTime;
  late final String endTime;
  late final int remind;
  late final String repeat;
  late final Color color;
  late int isCompleted;
  TasksModel.fromJson(Map<String, dynamic> json) {
    id:
    json["id"];
    title:
    json["title"];
    note:
    json["note"];
    date:
    json["date"];
    startTime:
    json["startTime"];
    endTime:
    json["endTime"];
    remind:
    json["remind"];
    repeat:
    json["repeat"];
    color:
    json["color"];
    isCompleted:
    json["isCompleted"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["note"] = note;
    data["date"] = date;
    data["startTime"] = startTime;
    data["endTime"] = endTime;
    data["color"] = color;
    data["remind"] = remind;
    data["repeat"] = repeat;
    data["isComplete"] = isCompleted;
    return data;
  }
}
