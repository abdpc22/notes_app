import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.loading = false});

  final bool loading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimarycolor,
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child: loading
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(color: Colors.black),
                )
              : const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
