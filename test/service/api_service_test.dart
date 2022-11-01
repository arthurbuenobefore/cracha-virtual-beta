import 'package:test/test.dart';
import 'package:cracha_virtual_beta/services/api_service.dart';
import 'package:cracha_virtual_beta/model/user.dart';

void main() {
  test("User returned should exists", () async {
    User user = await ApiService().fetchUser('arthurramires');
    expect(user, isA<User>());
  });

  test("User should not be returned", () async {
    expect(ApiService().fetchUser('johndoeteste'), throwsA(isA<Exception>()));
  });
}
