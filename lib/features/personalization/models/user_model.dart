import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String phoneNo;
  String profilePicture;

  UserModel({
    required this.name,
    required this.phoneNo,
    required this.id,
    required this.profilePicture,
  });

  static UserModel empty() =>
      UserModel(name: '', phoneNo: '', id: '', profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'PhoneNumber': phoneNo,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          name: data['Name'] ?? '',
          phoneNo: data['PhoneNmber'] ?? '',
          id: document.id,
          profilePicture: data['ProfilePicture'] ?? '');
    } else {
      return UserModel.empty();
    }
  }
}
