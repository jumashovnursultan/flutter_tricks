import 'package:flutter/material.dart';

class TrickModel {
  final String name;
  final TrickType? type;
  final Widget widget;

  TrickModel({
    required this.name,
    this.type,
    required this.widget,
  });
}

enum TrickType {
  widget,
  screen,
  dialog,
}
