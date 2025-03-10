class User {
  int? id;
  String? username;
  String? token;
  String? name;
  // ignore: non_constant_identifier_names
  String? contact_number;
  String? email;
  String? gender;

  User(
      {this.id,
      this.username,
      // ignore: non_constant_identifier_names
      this.contact_number,
      this.name,
      this.email,
      this.gender});

  factory User.fromJson(json) {
    return User(
      id: json["pk"],
      username: json["username"],
      email : json["email"],
      contact_number: json["contact_number"],
      name: json["username"],
    );
  }
}
