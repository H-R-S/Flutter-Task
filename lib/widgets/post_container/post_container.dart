import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';

class PostContainer extends StatelessWidget {
  final String title;
  final String description;

  const PostContainer({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: lightGrey)),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description)
          ],
        ),
      ),
    );
  }
}
