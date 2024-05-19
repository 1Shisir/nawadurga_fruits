import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/data/repositories/user/user_repository.dart';
import 'package:navadurga_fruits/features/personalization/models/user_model.dart';

import '../../../utils/consts/sizes.dart';
import '../../../utils/popups/loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageUploading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());
  final authRepository = AuthenticationRepository.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //save user record
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //First update Rx user and check if user data is already stored .If not store new data
      //refresh user record
      await fetchUserRecord();

      if (user.value.id!.isEmpty) {
        if (userCredentials != null) {
          //Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              phoneNo: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '',
              name: userCredentials.user!.displayName ?? '');

          //save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      Loader.errorSnackBar(
          title: 'Data not Saved',
          message:
              'Something went wrong while saving your Information.You can re-save your data in your Profile');
    }
  }

  //fetch user record

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //upload user profile picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        Loader.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Picture has been updated');
      }
    } catch (e) {
      Loader.errorSnackBar(
          title: 'Oh Snap!', message: 'Something went wrong:$e');
    } finally {
      imageUploading.value = false;
    }
  }

  ///delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(CustomSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure want to delete?This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () => authRepository.deleteAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: CustomSizes.lg),
              child: Text('Delete')),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }
}
