import 'package:flutter/material.dart';
import 'package:todo_hive/shared/app_theme.dart';
import 'package:todo_hive/view/notes_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const NotesView(),
    );
  }
}
