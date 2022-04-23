class Users {
  String uid;
  String name;
  String lastName;
  String email;
  String phone;

  Users(
      {required this.uid,
      required this.name,
      required this.lastName,
      required this.email,
      required this.phone});

  factory Users.fromJson(Map<String, dynamic> responseData) {
    return Users(
      uid: responseData['userUid'],
      name: responseData['name'],
      lastName: responseData['lastName'],
      email: responseData['email'],
      phone: responseData['phone'],
    );
  }
}
