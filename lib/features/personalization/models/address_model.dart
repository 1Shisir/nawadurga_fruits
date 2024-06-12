import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumber;
  final String tole;
  final String city;
  final String state;
  final String wardNo;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.tole,
    required this.city,
    required this.state,
    required this.country,
    required this.wardNo,
    this.dateTime,
    this.selectedAddress = true,
  });

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      phoneNumber: '',
      tole: '',
      city: '',
      state: '',
      country: '',
      wardNo: '');

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumber,
      'Tole': tole,
      'State': state,
      'City': city,
      'WardNo': wardNo,
      'Country': country,
      'DateTime': DateTime.now(),
      'SelectedAddress': selectedAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> json) {
    return AddressModel(
      tole: json['Tole'] as String,
      state: json['State'] as String,
      selectedAddress: json['SelectedAddress'] as bool,
      phoneNumber: json['PhoneNumber'] as String,
      country: json['Country'] as String,
      city: json['City'] as String,
      wardNo: json['WardNo'] as String,
      dateTime: (json['DateTime'] as Timestamp).toDate(),
      name: json['Name'] as String,
      id: json['Id'] as String,
    );
  }

  //factory model to create an AddressModel from a snapshot
  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return AddressModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      phoneNumber: data['PhoneNumber'] ?? '',
      tole: data['Tole'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      country: data['Country'] ?? '',
      wardNo: data['WardNo'] ?? '',
      dateTime: (data['DateTime'] as Timestamp).toDate(),
      selectedAddress: data['SelectedAddress'] as bool,
    );
  }

  @override
  String toString() {
    return '$tole, $city, $wardNo, $state, $country';
  }
}
