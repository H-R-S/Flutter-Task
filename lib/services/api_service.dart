import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task/model/user/user_model.dart';

import '../model/post/post_model.dart';

class APIService {
  static var client = http.Client();

  static Future<List<UserModel>> getUser(id) async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users?id=$id");

    var response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;

      return userModelFromJson(json);
    } else {
      return [];
    }
  }

  static Future<List<PostModel>> getPosts() async {
    var postUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    var response = await client.get(postUrl);

    if (response.statusCode == 200) {
      var json = response.body;

      return postModelFromJson(json);
    } else {
      return [];
    }
  }
}
