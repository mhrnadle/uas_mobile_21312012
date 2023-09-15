import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;
  late TextEditingController cJk;
  late TextEditingController cProgramstudi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void addProduct(String nama, String npm, String alamat) async {
    CollectionReference products = firestore.collection("mahasiswa_21312012");

    try{
      await products.add({
        "nama": nama,
        "npm": npm,
        "alamat" : alamat,

    });
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil menyimpan data mahasiswa",
      onConfirm: () {
        cNama.clear();
        cNpm.clear();
        cAlamat.clear();
        Get.back();
        Get.back();
        Get.back();
        textConfirm:
        "OK";
      });
    } catch(e){

    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();
    super.onClose();
  }
}