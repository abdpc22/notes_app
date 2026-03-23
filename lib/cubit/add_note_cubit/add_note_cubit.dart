import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNotes(NoteModal note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModal>(kNotesBox);
      notesBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(errmsg: e.toString()));
    }
  }
}
