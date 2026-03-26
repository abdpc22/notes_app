import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color noteColor = const Color.fromRGBO(50, 50, 50, 1);

  void addNote(NoteModal note) async {
    note.color = noteColor.toARGB32();
    emit(AddNoteLoading());
    try {
      var notebox = Hive.box<NoteModal>(kNotesBox);
      await notebox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errmsg: e.toString()));
    }
  }
}
