import 'package:flutter_day_18/models/user.dart';

class UserController {
  UserController._();

  static final UserController _controller = UserController._();

  factory UserController() {
    return _controller;
  }

  final List<User> users = [
    User(name: "Musoxon", email: "musoxon@gmail.com", password: "12345"),
  ];

  bool signUp({required User user}) {
    return checkForExistence(user.email);
  }

  bool authSuccess(String email, String password) {
    return users.any((user) => user.email == email && user.password == password);
  }

  bool checkForExistence(String email) {
    return users.any((element) => element.email == email);
  }
}
