import 'package:flutter/material.dart';

Widget namedAppBar(String title) {
  return AppBar(
    centerTitle: true,
    title: Text(title, style: TextStyle(color: Colors.white)),
  );
}
