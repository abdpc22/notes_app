import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key, this.hinttext, this.maxlines = 1});

  final int maxlines;
  final String? hinttext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimarycolor,
      maxLines: maxlines,
      decoration: InputDecoration(
        border: build_border(),
        enabledBorder: build_border(Colors.white),
        focusedBorder: build_border(kPrimarycolor),
        hintText: hinttext,
        hintStyle: TextStyle(fontSize: 18),
      ),
    );
  }

  OutlineInputBorder build_border([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Color ?? Colors.white),
    );
  }
}
