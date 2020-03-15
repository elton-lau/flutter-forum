import 'dart:core';

class User {
  int id;
  String name;
  String userName;

  User({this.id, this.name, this.userName});

  User.initial() {
    id = 0;
    name = '';
    userName = '';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
    );
  }

//  User.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    name = json['name'];
//    userName = json['username'];
//  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.userName;
    return data;
  }
}
