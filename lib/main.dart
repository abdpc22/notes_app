import 'package:flutter/material.dart';
import 'package:notesapp/Views/NotesView.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          titleSpacing: 2,
        ),
      ),
      home: const NotesView(),
    );
  }
}
