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

  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      city: data['City'] as String? ?? '',
      country: data['Country'] as String? ?? '',
      dateTime: data['DateTime'] != null
          ? (data['DateTime'] as Timestamp).toDate()
          : DateTime.now(),
      name: data['Name'] as String? ?? '',
      phoneNumber: data['PhoneNumber'] as String? ?? '',
      selectedAddress: data['SelectedAddress'] as bool,
      state: data['State'] as String? ?? '',
      tole: data['Tole'] as String? ?? '',
      wardNo: data['WardNo'] as String? ?? '',
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
