import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/Models/NoteModal.dart';
import 'package:notesapp/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubit/read_notes_cubit/read_notes_cubit.dart';
import 'ColorListView.dart';
import 'CustomButton.dart';
import 'CustomTextField.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final GlobalKey<FormState> formk = GlobalKey();
  AutovalidateMode autov = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autov,
      key: formk,
      child: Column(
        children: [
          //container with the textFields and button
          Container(
            padding: const EdgeInsets.only(top: 50, right: 25, left: 20),
            child: Column(
              children: [
                Customtextfield(
                  hinttext: "Title",
                  onsave: (value) {
                    title = value;
                  },
                ),
                const SizedBox(height: 30),
                Customtextfield(
                  hinttext: 'content',
                  maxlines: 5,
                  onsave: (value) => subtitle = value,
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          SizedBox(height: 10),
          ColorsListView(),
          SizedBox(height: 10),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                loading: state is AddNoteLoading ? true : false,
                onTap: () {
                  AddNoteLogic(context);
                },
              );
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  void AddNoteLogic(BuildContext context) {
    if (formk.currentState!.validate()) {
      formk.currentState!.save();
      var Date = DateFormat("dd-mm-yyyy").format(DateTime.now()).toString();
      var Note_m = NoteModal(
        title: title!,
        content: subtitle!,
        date: Date,
        color: Colors.teal.toARGB32(),
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(Note_m);
    } else {
      autov = AutovalidateMode.always;
    }
    BlocProvider.of<ReadNotesCubit>(context).FetchAllNotes();
  }
}
