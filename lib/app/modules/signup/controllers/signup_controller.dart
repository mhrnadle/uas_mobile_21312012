import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
  final cEmail = TextEditingController();
  final cPass = TextEditingController();

  void onClose(){
    cEmail.dispose();
    cPass.dispose();
    super.onClose();
  }
}
