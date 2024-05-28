import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_storage/get_storage.dart';
import 'package:navadurga_fruits/app.dart';
import 'package:navadurga_fruits/bindings/dependency_injections.dart';
import 'package:navadurga_fruits/data/repositories/authentication/authentication_repository.dart';
import 'package:navadurga_fruits/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // CustomLocalStorage.init('');

  DependencyInjections.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  await GetStorage.init();

  runApp(const MyApp());
}
