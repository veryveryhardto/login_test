import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:login_test/Data/Users.dart';

List<Users> userFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));
String userToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services{
  static const String signUpURL = 'http://59.1.94.97:3002/sign-up';
  static const String signInURL = 'http://59.1.94.97:3002/sign-in';

  static Future <List<Users>> getInfo(String url) async {
    try {
      final response = await http.get(Uri.parse(signInURL+url));
      if (response.statusCode == 200) {
        List<Users> users = userFromJson(response.body);
        return users;
      }else{
        return <Users>[];
      }
    } catch (e) {
      return <Users>[];
    }
  }
  static Future <dynamic> postData(dynamic data) async {
    final response = await http.post(Uri.parse(signUpURL),body:userToJson(data));
    return response.statusCode;
  }
}