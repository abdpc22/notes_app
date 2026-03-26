import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubit/read_notes_cubit/read_notes_cubit.dart';
import '../Widgets/ModalSheet.dart';
import '../Widgets/NotesViewBody.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ReadNotesCubit(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: const NotesViewBody(),
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: Colors.tealAccent,
                child: Icon(Icons.add, color: Colors.black),
                onPressed: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(30),
                    ),
                    context: context,
                    builder: (context) => ModalSheet(),
                  );
                  if (context.mounted) {
                    BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
