import 'package:flutter/material.dart';
import 'package:notesapp/Widgets/CustomAppBar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomAppBar(),
        ),
      ],
    );
  }
}
