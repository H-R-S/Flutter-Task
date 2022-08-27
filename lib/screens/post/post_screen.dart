import 'package:flutter/material.dart';
import 'package:task/constants/style.dart';
import 'package:http/http.dart' as http;
import 'package:task/services/api_service.dart';
import 'package:task/widgets/post_container/post_container.dart';
import '../../model/post/post_model.dart';

class PostScreen extends StatefulWidget {
  final num id;

  const PostScreen({required this.id});
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
    posts = await APIService.getPosts();

    setState(() {
      isLoading = true;
    });
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
