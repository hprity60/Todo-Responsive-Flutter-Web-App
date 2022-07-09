// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum TaskPriority { High, Medium, Low }

///To convert a string bool (i.e. "true"/"false") to normal boll value
bool boolParse(String bStr) {
  if (bStr == "true") {
    return true;
  } else if (bStr == " false") {
    return false;
  }
  return false;
}

extension DateTimeExtention on DateTime {
  DateTime copywith({int year, int month, int day, int hour, int minute}) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second,
      millisecond,
      microsecond,
    );
  }
}

class Task {
  Task({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.priority,
    @required this.dueDate,
    @required this.belongsTo,
    @required this.isFinished,
  });

  final String id;
  final String title;

  ///The description of the task (optional)
  final String body;
  final TaskPriority priority;
  final DateTime dueDate;

  ///to identify which list the task belongs to
  final String belongsTo;
  final bool isFinished;

  factory Task.fromMap(Map json) {
    return Task(
        id: json['id'],
        title: json["title"],
        body: json["body"],
        priority:
            TaskPriority.values.firstWhere((p) => p.index == json["priority"]),
        dueDate: json["dueDate"].toString().isNotEmpty
            ? DateTime.parse(json["dueDate"])
            : null,
        belongsTo: json["belongsTo"],
        isFinished: boolParse(json['isFinished']));
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
        "priority": priority.index,
        "dueDate": dueDate?.toIso8601String() ?? '',
        "belongsTo": belongsTo,
        "isFinished": isFinished.toString()
      };

  Task copyWith({
    String id,
    String title,
    String body,
    TaskPriority priority,
    DateTime dueDate,
    DateTime createdAt,
    String belongsTo,
    bool isFinished,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      priority: priority ?? this.priority,
      dueDate: dueDate ?? this.dueDate,
      belongsTo: belongsTo ?? this.belongsTo,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, body: $body, priority: $priority, dueDate: $dueDate, belongsTo: $belongsTo, isFinished: $isFinished)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Task &&
        o.id == id &&
        o.title == title &&
        o.body == body &&
        o.priority == priority &&
        o.dueDate == dueDate &&
        o.belongsTo == belongsTo &&
        o.isFinished == isFinished;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        body.hashCode ^
        priority.hashCode ^
        dueDate.hashCode ^
        belongsTo.hashCode ^
        isFinished.hashCode;
  }
}
