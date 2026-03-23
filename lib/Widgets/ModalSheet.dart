import 'package:flutter/material.dart';
import 'CustomButton.dart';
import 'CustomTextField.dart';

class ModalSheet extends StatelessWidget {
  const ModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(child: NoteForm());
  }
}

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
          CustomButton(
            onTap: () {
              if (formk.currentState!.validate()) {
                formk.currentState!.save();
              } else {
                autov = AutovalidateMode.always;
              }
              setState(() {});
            },
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
