class User {
  int? id;
  String name;
  String password;

  User({
    this.id,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }
}