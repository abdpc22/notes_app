import 'package:flutter/material.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/Widgets/CustomAppBar.dart';
import 'package:notesapp/Widgets/CustomTextField.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModal note;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomAppBar(txt: "Edit", ico: Icons.check, tap: () {}),
          ),
          const SizedBox(height: 30),
          const Customtextfield(hinttext: "edit here"),
          const SizedBox(height: 30),
          const Customtextfield(hinttext: "content", maxlines: 5),
        ],
      ),
    );
  }
}
