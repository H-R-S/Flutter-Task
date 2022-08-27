import 'package:flutter/cupertino.dart';
import '../../constants/style.dart';

class UserDetailContainer extends StatelessWidget {
  final String title;
  final String body;

  const UserDetailContainer({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: lightGrey)),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(body, style: const TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}
