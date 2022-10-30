import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:cracha_virtual_beta/constants.dart';
import 'package:cracha_virtual_beta/model/user.dart';

class ApiService {
  Future<UserModel?> getUser(String username) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrlApi + username);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        UserModel _model =
            UserModel.fromJson(response.body as Map<String, dynamic>);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
