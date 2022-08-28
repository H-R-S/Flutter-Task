import 'package:flutter/cupertino.dart';
import '../../constants/style.dart';

class UserDetailContainer extends StatelessWidget {
  final String title;
  final String body;

  const UserDetailContainer({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: lightGrey)),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.40,
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
                width: width * 0.40,
                child: Text(body,
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
