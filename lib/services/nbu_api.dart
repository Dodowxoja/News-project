import 'package:dio/dio.dart';

class NBUApi {
  static Future getData() async {
    Response res = await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
    return res.data;
  }
}
