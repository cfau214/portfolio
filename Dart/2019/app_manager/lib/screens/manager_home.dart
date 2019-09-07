import 'package:flutter/material.dart';
import 'package:app_manager/shared_widgets/app_bar.dart';

class ManagerHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: namedAppBar('App Manager'),
    );
  }
}