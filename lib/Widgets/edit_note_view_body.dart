import 'package:flutter/material.dart';
import 'package:notesapp/Widgets/CustomAppBar.dart';
import 'package:notesapp/Widgets/CustomTextField.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: CustomAppBar(txt: "Edit", ico: Icons.check),
          ),
          SizedBox(height: 30),
          Customtextfield(hinttext: "edit here"),
          SizedBox(height: 30),
          Customtextfield(hinttext: "content", maxlines: 5),
        ],
      ),
    );
  }
}
