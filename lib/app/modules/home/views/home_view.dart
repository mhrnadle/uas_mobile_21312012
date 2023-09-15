import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_21312012/app/controllers/auth_controller.dart';
import 'package:uas_21312012/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOption(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(
                Routes.UPDATE_PRODUCT, 
                arguments: id,
                );
            },
            title: Text("update"),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.deleteProduct(id);
            },
            title: Text("delete"),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text("close"),
          )
        ],
      ),
      barrierDismissible: false,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () => cAuth.logout(), 
            icon: Icon(Icons.logout)),
        ],
      ),
      //1. menampilkan data tidak realtime
    //  body: FutureBuilder<QuerySnapshot<Object?>>(
    //     future: controller.GetData(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         // mengambil data
    //         var listAllDocs = snapshot.data!.docs;
    //         return ListView.builder(
    //           itemCount: listAllDocs.length,
    //           itemBuilder: (context, index) => ListTile(
    //             title: Text(
    //                 "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
    //             subtitle: Text(
    //                 "${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}"),
    //           ),
    //         );
    //       }
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     },
    //   ),

    //menampilkan data secara realtime
     body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // mengambil data
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                  backgroundColor: Color.fromARGB(255, 251, 228, 103),
                ),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}"),
                trailing: IconButton(
                  onPressed: () => showOption(listAllDocs[index].id), 
                  icon: Icon(Icons.more_vert)),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT), 
        child: Icon(Icons.add),
        ),
    );
  }
}
