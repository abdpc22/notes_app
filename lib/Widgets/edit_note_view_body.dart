import 'package:flutter/material.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/Widgets/CustomAppBar.dart';
import 'package:notesapp/Widgets/CustomTextField.dart';
import 'EditNoteListView.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModal note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomAppBar(
              txt: "Edit",
              ico: Icons.check,
              tap: () {
                //if the value is empty then default back to original
                widget.note.title = title ?? widget.note.title;
                widget.note.content = content ?? widget.note.content;
                widget.note.save();
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(height: 30),
          Customtextfield(
            hinttext: "title",
            onchanged: (value) {
              title = value!;
            },
          ),
          const SizedBox(height: 30),
          Customtextfield(
            hinttext: "content",
            maxlines: 5,
            onchanged: (value) {
              content = value!;
            },
          ),
          SizedBox(height: 20),
          EditColorListView(note: widget.note),
        ],
      ),
    );
  }
}
