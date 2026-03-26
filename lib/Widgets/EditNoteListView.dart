import 'package:flutter/material.dart';

import '../Models/NoteModal.dart';
import '../constants.dart';
import 'ColorListView.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.note});

  final NoteModal note;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currIndex;

  @override
  void initState() {
    currIndex = noteColors.indexOf(Color(widget.note.color));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: noteColors.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: GestureDetector(
            onTap: () {
              currIndex = index;
              widget.note.color = noteColors[index].toARGB32();
              widget.note.save();
              setState(() {});
            },
            child: ColorItem(
              isActive: currIndex == index,
              color: noteColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
