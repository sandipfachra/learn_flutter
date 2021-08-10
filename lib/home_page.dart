import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 10;
  final String name = "sandip";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple App'),
      ),
      body: Center(
        child: Container(
          child: Text(
              "Hey $name, You learn $days days to complete flutter course."),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
