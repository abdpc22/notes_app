import 'package:flutter/material.dart';
import 'package:notesapp/constants.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    this.hinttext,
    this.maxlines = 1,
    this.onsave,
  });

  final int maxlines;
  final String? hinttext;
  final void Function(String?)? onsave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Field is empty";
        } else {
          return null;
        }
      },
      onSaved: onsave,
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

  OutlineInputBorder build_border([C]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: C ?? Colors.white),
    );
  }
}
