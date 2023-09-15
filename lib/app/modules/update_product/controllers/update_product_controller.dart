import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa_21312012").doc(id);

    return docRef.get();
  }

  void updateProduct(String nama, String npm, String alamat, String id) async {
    DocumentReference productById = firestore.collection("mahasiswa_21312012").doc(id);
    try {
      await productById.update({
        "nama": nama,
        "npm": npm,
        "alamat" : alamat,

      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data product.",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );

    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Product.",
      );
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
