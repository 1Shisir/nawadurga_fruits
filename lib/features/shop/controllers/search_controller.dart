import 'package:get/get.dart';

class CustomSearchController extends GetxController {
  var searchText = ''.obs;

  void setSearchText(String text) {
    searchText.value = text;
  }
}
