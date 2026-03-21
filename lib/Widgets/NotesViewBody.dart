import 'package:flutter/material.dart';
import 'package:notesapp/Widgets/CustomAppBar.dart';

import 'NoteItem.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomAppBar(),
        ),
        NotesListView(),
      ],
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final data = const [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const NoteItem();
        },
      ),
    );
  }
}
