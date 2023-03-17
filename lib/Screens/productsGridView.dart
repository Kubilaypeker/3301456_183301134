import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productPreviewPage.dart';
import 'package:merkezledapp/widgets/drawerWidget.dart';
import 'package:merkezledapp/widgets/productPreview.dart';

class productsGridViewScreen extends StatelessWidget {
  productsGridViewScreen({Key? key, this.marka}) : super(key: key);

  var marka;

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore db = FirebaseFirestore.instance;

    final markaRef = db
        .collection("Ledler")
        .doc("gR54jNsQR0XrpFZIg1bk")
        .collection(marka);

    return Scaffold(
        backgroundColor: const Color(0xff383737),
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: const Color(0xff383737),
          centerTitle: true,
          title: SizedBox(
              height: 50,
              child: Image.asset('assets/logo-no-background.png',)),
        ),
        drawer: drawerWidget(),
      body: Stack(
          children: [
            Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: Text("$marka LED'ler",
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
                    ),
                  ),
                  Flexible(
                    child: StreamBuilder(
        stream: markaRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
          if (querySnapshot.hasData) {
            return GridView.builder(

              itemCount: querySnapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 165/200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
            ),
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
    ),
                ]
      ),
            Container(
              padding: const EdgeInsets.only(right: 10, bottom: 20),
              alignment: Alignment.bottomRight,
              child:FloatingActionButton(
                  backgroundColor: Colors.green.shade800,
                  onPressed: launchWhatsAppUri,
                  child: const Icon(FontAwesomeIcons.whatsapp)
              ),
            ),
      ]
    ),
    );
  }
}
