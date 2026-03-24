import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/cubit/add_note_cubit/add_note_cubit.dart';
import 'NoteForm.dart';

class ModalSheet extends StatelessWidget {
  ModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print("failed ${state.errmsg}");
          }
          if (state is AddNoteSuccess) {}
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: NoteForm(),
          );
        },
      ),
    );
  }
}
