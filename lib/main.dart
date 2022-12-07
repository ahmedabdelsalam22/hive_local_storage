import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_hive/shared/app_theme.dart';
import 'package:todo_hive/shared/constance.dart';
import 'package:todo_hive/view/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(AppConsts.kNotesBox);

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
