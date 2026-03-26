import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/Widgets/CustomAppBar.dart';
import 'package:notesapp/cubit/read_notes_cubit/read_notes_cubit.dart';

import 'NoteItem.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomAppBar(ico: Icons.search),
        ),
        NotesListView(),
      ],
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        List<NoteModal> notes =
            BlocProvider.of<ReadNotesCubit>(context).notes ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return NoteItem(note: notes[index]);
            },
          ),
        );
      },
    );
  }
}
