import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:merkezledapp/widgets/productPreview.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:merkezledapp/Screens/storage_service.dart';

class productPreview extends StatelessWidget {
   productPreview({Key? key, this.marka}) : super(key: key);

    var marka;

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore db = FirebaseFirestore.instance;


    final markaRef = db
        .collection("Ledler")
        .doc("gR54jNsQR0XrpFZIg1bk")
        .collection(marka);


    return  Container(
      alignment: Alignment.centerLeft,
      height: 230,
        child: StreamBuilder(
        stream: markaRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
          if (querySnapshot.hasData) {
            return ListView.builder(

              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: querySnapshot.data!.docs.length,
              itemBuilder: (context, int index) {
                final DocumentSnapshot documentSnapshot = querySnapshot.data!.docs[index];
                return product(
                  model: documentSnapshot["Model"],
                  image: documentSnapshot["image"],
                  uzunluk: documentSnapshot["Uzunluk"],
                  kod: documentSnapshot["Kod"],
                  set: documentSnapshot["Set"],
                  fiyat: documentSnapshot["Fiyat"],
                  led: documentSnapshot["Led"],
                );
              },
            );
          }
          else {
            return const Center(
            child: CircularProgressIndicator(),
          );
          }
        },
      ),
    );
  }
}
