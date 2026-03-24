import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/constants.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial());
  List<NoteModal>? notes = [];

  FetchAllNotes() {
    var notesbox = Hive.box<NoteModal>(kNotesBox);
    notes = notesbox.values.toList();
    emit(ReadNotesSuccess());
  }
}
