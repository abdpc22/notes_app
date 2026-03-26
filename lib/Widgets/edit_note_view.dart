import 'package:flutter/material.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModal note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(note: note));
  }
}
