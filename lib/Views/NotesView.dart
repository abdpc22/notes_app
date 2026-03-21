import 'package:flutter/material.dart';
import 'package:notesapp/Widgets/CustomTextField.dart';
import '../Widgets/CustomButton.dart';
import '../Widgets/NotesViewBody.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.tealAccent,
          child: Icon(Icons.add, color: Colors.black),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(30),
              ),
              context: context,
              builder: (context) => ModalSheet(),
            );
          },
        ),
      ),
    );
  }
}

class ModalSheet extends StatelessWidget {
  const ModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, right: 25, left: 20),
            child: Column(
              children: const [
                Customtextfield(hinttext: "Title"),
                SizedBox(height: 30),
                Customtextfield(hinttext: 'content', maxlines: 5),
                SizedBox(height: 15),
              ],
            ),
          ),
          CustomButton(),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
