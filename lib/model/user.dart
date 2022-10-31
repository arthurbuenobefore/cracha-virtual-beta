class User {
  int id;
  String name;
  String login;
  String avatar_url;
  String url;

  User({
    required this.id,
    required this.login,
    required this.name,
    required this.avatar_url,
    required this.url,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      login: json['login'],
      name: json['name'],
      url: json['url'],
      avatar_url: json['avatar_url'],
    );
  }
}
