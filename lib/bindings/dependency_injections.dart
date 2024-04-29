import 'package:get/get.dart';
import 'package:navadurga_fruits/utils/http/network_manager.dart';

class DependencyInjections {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
