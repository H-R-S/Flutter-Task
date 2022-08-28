import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';

class PostContainer extends StatelessWidget {
  final num id;
  final num userId;
  final String title;
  final String description;

  const PostContainer(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description});

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
                style: TextStyle(
                    color: id != userId ? null : primaryColor,
                    fontSize: 16,
                    fontWeight: id != userId ? null : FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description,
                style: TextStyle(
                    fontWeight: id != userId ? null : FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
