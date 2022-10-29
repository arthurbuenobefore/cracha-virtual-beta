import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.login,
    required this.name,
    required this.avatar_url,
    required this.url,
  });

  int id;
  String name;
  String login;
  String avatar_url;
  String url;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      name: json["name"],
      login: json["login"],
      avatar_url: json["avatar_url"],
      url: json["url"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "login": login,
        "avatar_url": avatar_url,
        "url": url,
      };
}
