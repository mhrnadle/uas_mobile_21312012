import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final cEmail = TextEditingController();
  final cPass = TextEditingController();

  void onClose(){
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }
}