import 'package:dio/dio.dart';

class CommentsApi {
  static Future getData() async {
    Response res =
        await Dio().get("https://jsonplaceholder.typicode.com/comments");
    return res.data;
  }
}
