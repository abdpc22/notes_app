import 'package:flutter/material.dart';
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
    return Container();
  }
}
