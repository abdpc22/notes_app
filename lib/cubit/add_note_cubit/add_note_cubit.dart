import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteModal note) async {
    emit(AddNoteLoading());
    try {
      var notebox = Hive.box<NoteModal>(kNotesBox);
      emit(AddNoteSuccess());
      await notebox.add(note);
    } catch (e) {
      emit(AddNoteFailure(errmsg: e.toString()));
    }
  }
}
