import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.ico,
    this.txt = "Notes",
    this.tap,
  });

  final Function()? tap;
  final IconData ico;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt, style: TextStyle(color: Colors.white, fontSize: 28)),
        CustomSearchIcon(icon: ico, tap: tap),
      ],
    );
  }
}

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon, this.tap});

  final Function()? tap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(onPressed: tap, iconSize: 25, icon: Icon(icon)),
      ),
    );
  }
}
