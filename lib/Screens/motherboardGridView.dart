import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productPreviewPage.dart';
import 'package:merkezledapp/widgets/drawerWidget.dart';
import 'package:merkezledapp/widgets/productPreview.dart';
import 'package:merkezledapp/Screens/motherBoardPreview.dart';
import 'package:merkezledapp/widgets/searchBarStreamBuilder.dart';
import 'package:merkezledapp/widgets/searchMotherBoard.dart';
import 'package:merkezledapp/widgets/searchMotherBoardWidget.dart';

class motherBoardGridViewScreen extends StatefulWidget {
  const motherBoardGridViewScreen({Key? key}) : super(key: key);

  @override
  State<motherBoardGridViewScreen> createState() => _motherBoardGridViewScreenState();
}

class _motherBoardGridViewScreenState extends State<motherBoardGridViewScreen> {

  String modelNameText = "";

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore db = FirebaseFirestore.instance;

    final markaRef = db
        .collection("Anakartlar");

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
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: Text("Anakartlar",
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
                              childAspectRatio: 165/220,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, int index) {
                              final DocumentSnapshot documentSnapshot = querySnapshot.data!.docs[index];
                              return motherBoardProduct(
                                marka: documentSnapshot["Marka"],
                                model: documentSnapshot["Model"],
                                fiyat: documentSnapshot["Fiyat"],
                                kod: documentSnapshot["Kod"],
                                image: documentSnapshot["image"],
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
            Column(
                children: [
                  CupertinoSearchTextField(
                    onChanged: (searchText) {
                      setState(() {
                        modelNameText = searchText;
                      });
                    },
                    backgroundColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.black,),
                    placeholder: "Aradığınız ürünü giriniz",
                    placeholderStyle: GoogleFonts.inter(color: Colors.black),
                  ),
                  Flexible(
                      fit: FlexFit.loose,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          searchMotherBoardStreamBuilder(modelName: modelNameText)
                        ],
                      )
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
