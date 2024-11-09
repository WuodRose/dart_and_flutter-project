class User {
  final int id;
  final String username;
  final String email;
  final String token;
  final String name;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'name': name,
    };
  }

  // Add a copy with method for easy cloning with modifications
  User copyWith({
    int? id,
    String? username,
    String? email,
    String? token,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      token: token ?? this.token,
      name: name ?? this.name,
    );
  }

  // Add equality operator
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          email == other.email &&
          token == other.token &&
          name == other.name;

  // Add hashCode
  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      token.hashCode ^
      name.hashCode;

  // Add toString for easier debugging
  @override
  String toString() {
    return 'User{id: $id, username: $username, email: $email, name: $name}';
  }
}