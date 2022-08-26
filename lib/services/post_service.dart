import 'package:http/http.dart' as http;
import 'package:task/model/post/post_model.dart';

class PostService {
  Future<List<PostModel>> getPosts() async {
    var client = http.Client();

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
