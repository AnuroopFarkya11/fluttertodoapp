class UserModel {
  final String email;
  final String username;
  final String name;

  UserModel(this.email, this.username, this.name);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'name': name,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['email'],
      json['username'],
      json['name'],
    );
  }
}
