import 'package:flutter/material.dart';
import 'package:notesapp/Views/NotesView.dart';
import 'package:notesapp/Widgets/edit_note_view.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {"editnote": (context) => EditNoteView()},
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
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
