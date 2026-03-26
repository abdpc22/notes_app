import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/Widgets/edit_note_view.dart';
import 'package:notesapp/cubit/read_notes_cubit/read_notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModal note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNoteView(note: note)),
        );
        if (context.mounted) {
          BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
        padding: const EdgeInsets.only(top: 14, left: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withAlpha(100),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.delete, color: Colors.black, size: 35),
                onPressed: () {
                  note.delete();
                  BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
