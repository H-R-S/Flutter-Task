import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';
import 'package:task/widgets/post_container/post_container.dart';
import '../../model/post/post_model.dart';
import '../../services/post_service.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool isLoading = false;
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();

    getPostData();
  }

  getPostData() async {
    posts = await PostService().getPosts();

    if (posts != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      replacement:
          const Center(child: CircularProgressIndicator(color: primaryColor)),
      child: Scaffold(
        body: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return PostContainer(
                  title: posts[index].title ?? "",
                  description: posts[index].body ?? "");
            }),
      ),
    );
  }
}
