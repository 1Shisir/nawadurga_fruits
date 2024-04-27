import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../authentication/authentication_repository.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to save user data in firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to fetch user details based on UserId
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to update user details
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to update any field in specific users collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //function to remove data from firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //Upload any Image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const CustomFormatExceptions();
    } on PlatformException catch (e) {
      throw CustomPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
