import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cracha_virtual_beta/constants.dart';
import 'package:cracha_virtual_beta/model/user.dart';

class ApiService {
  Future<User> fetchUser(String username) async {
    var url = Uri.parse(ApiConstants.baseUrlApi + username);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Desculpe, não conseguimos encontrar nenhum usuário.');
    }
  }
}
