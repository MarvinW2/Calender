import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class ToDo {
  final DateTime startDate;
  final int id;
  final String title;
  final DateTime? dueDate;
  bool isCompleted = false;

  ToDo(this.title,[this.dueDate]) :
        startDate = DateTime.now(),
        id = DateTime.now().millisecondsSinceEpoch
  ;

  void complete() {
  isCompleted = true;
  }

  void incomplete(){
  isCompleted = false;
  }

}
