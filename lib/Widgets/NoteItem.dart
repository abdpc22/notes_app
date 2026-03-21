import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35, right: 35, top: 20),
      padding: const EdgeInsets.only(top: 14, left: 16, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Flutter Tips'),
            titleTextStyle: const TextStyle(color: Colors.black, fontSize: 26),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text(
                'Build your career with me',
                style: TextStyle(
                  color: Colors.black.withAlpha(100),
                  fontSize: 18,
                ),
              ),
            ),
            trailing: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.delete, color: Colors.black, size: 35),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              "May21, 2000",
              style: TextStyle(color: Colors.black.withAlpha(60), fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
