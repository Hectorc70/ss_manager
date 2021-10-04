class UserModel {
  final id;
  final name;
  final email;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) => UserModel(
        id: data['id'],
        name: data['full_name'],
        email: data['email'],
      );
}
