import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/authenticationService.dart';
import 'package:merkezledapp/main.dart';
import 'package:merkezledapp/widgets/drawerWidget.dart';
import 'package:merkezledapp/widgets/searchBarStreamBuilder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:merkezledapp/widgets/scrollViewWidget.dart';


class productPreviewPage extends StatefulWidget {
  const productPreviewPage({Key? key}) : super(key: key);

  @override
  State<productPreviewPage> createState() => _productPreviewPageState();
}

class _productPreviewPageState extends State<productPreviewPage> {

  Future<QuerySnapshot>? postDocumentsList;
  String modelNameText = "";



  initSearchingPost(String searchText) {
    postDocumentsList = FirebaseFirestore.instance.collection("Ledler")
        .where("Model", isGreaterThanOrEqualTo: searchText).get();

    setState(() {
      postDocumentsList;
    });
  }

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore db = FirebaseFirestore.instance;

    final markaRef = db
        .collection("Reklam");

    return Scaffold(
      backgroundColor: const Color(0xff383737),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xff383737),
        centerTitle: true,
        title: SizedBox(
          height: 50,
            child: Image.asset('assets/logo-no-background.png',)),
        actions: <IconButton>[
          IconButton(onPressed: () {
            context.read<AuthenticationService>().signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AuthenticationWrapper(),
              ),
            );
          },
              icon:const Icon(Icons.logout))
        ],
      ),
      drawer: drawerWidget(),
      body: Stack(
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: [ Flexible(
            child: ListView(
              shrinkWrap: true,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                child: StreamBuilder(
                stream: markaRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
          if (querySnapshot.hasData) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(seconds: 3),
            ),
            itemCount: querySnapshot.data!.docs.length,
            itemBuilder: (context, int index, int index2) {
              final DocumentSnapshot documentSnapshot = querySnapshot.data!.docs[index];
              return Image.network(documentSnapshot["image"], fit: BoxFit.fill,);
                },
              );
            }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
              ),
              scrollView(marka: "Arçelik",),
              scrollView(marka: "Altus"),
              scrollView(marka: "Awox",),
              scrollView(marka: "Axen"),
              scrollView(marka: "Beko",),
              scrollView(marka: "Botech"),
              scrollView(marka: "Finlux"),
              scrollView(marka: "Grundig"),
              scrollView(marka: "Hi-level"),
              scrollView(marka: "Homstar",),
              scrollView(marka: "Jameson"),
              scrollView(marka: "LG",),
              scrollView(marka: "NEXON"),
              scrollView(marka: "Next",),
              scrollView(marka: "Nordmande",),
              scrollView(marka: "Philips",),
              scrollView(marka: "Premier",),
              scrollView(marka: "Redline",),
              scrollView(marka: "Regal"),
              scrollView(marka: "Saba"),
              scrollView(marka: "Samsung",),
              scrollView(marka: "Sanyo",),
              scrollView(marka: "Seg"),
              scrollView(marka: "Skytech"),
              scrollView(marka: "Sonny",),
              scrollView(marka: "Sunny",),
              scrollView(marka: "Techwood"),
              scrollView(marka: "Telefox"),
              scrollView(marka: "Telefunken"),
              scrollView(marka: "Toshiba"),
              scrollView(marka: "Vestel",),
              scrollView(marka: "WOON"),
              scrollView(marka: "Yumatu",),
              ]
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
                        searchStreamBuilder(model: "Arçelik", modelName: modelNameText,),
                        searchStreamBuilder(model: "Altus", modelName: modelNameText,),
                        searchStreamBuilder(model: "Awox", modelName: modelNameText,),
                        searchStreamBuilder(model: "Axen", modelName: modelNameText,),
                        searchStreamBuilder(model: "Beko", modelName: modelNameText,),
                        searchStreamBuilder(model: "Botech", modelName: modelNameText,),
                        searchStreamBuilder(model: "Finlux", modelName: modelNameText,),
                        searchStreamBuilder(model: "Grundig", modelName: modelNameText,),
                        searchStreamBuilder(model: "Hi-level", modelName: modelNameText,),
                        searchStreamBuilder(model: "Homstar", modelName: modelNameText,),
                        searchStreamBuilder(model: "Jameson", modelName: modelNameText,),
                        searchStreamBuilder(model: "LG", modelName: modelNameText,),
                        searchStreamBuilder(model: "Nexon", modelName: modelNameText,),
                        searchStreamBuilder(model: "Next", modelName: modelNameText,),
                        searchStreamBuilder(model: "Nordmande", modelName: modelNameText,),
                        searchStreamBuilder(model: "Philips", modelName: modelNameText,),
                        searchStreamBuilder(model: "Premier", modelName: modelNameText,),
                        searchStreamBuilder(model: "Redline", modelName: modelNameText,),
                        searchStreamBuilder(model: "Regal", modelName: modelNameText,),
                        searchStreamBuilder(model: "Saba", modelName: modelNameText,),
                        searchStreamBuilder(model: "Samsung", modelName: modelNameText,),
                        searchStreamBuilder(model: "Sanyo", modelName: modelNameText,),
                        searchStreamBuilder(model: "Seg", modelName: modelNameText,),
                        searchStreamBuilder(model: "Skytech", modelName: modelNameText,),
                        searchStreamBuilder(model: "Sonny", modelName: modelNameText,),
                        searchStreamBuilder(model: "Sunny", modelName: modelNameText,),
                        searchStreamBuilder(model: "Techwood", modelName: modelNameText,),
                        searchStreamBuilder(model: "Telefox", modelName: modelNameText,),
                        searchStreamBuilder(model: "Telefunken", modelName: modelNameText,),
                        searchStreamBuilder(model: "Toshiba", modelName: modelNameText,),
                        searchStreamBuilder(model: "Vestel", modelName: modelNameText,),
                        searchStreamBuilder(model: "WOON", modelName: modelNameText,),
                        searchStreamBuilder(model: "Yumatu", modelName: modelNameText,),
                      ],
                    )
                ),
              ]
          ),
          Container(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            alignment: Alignment.bottomRight,
              child:FloatingActionButton(
              backgroundColor: Colors.green.shade800,
              onPressed: launchWhatsAppUri,
              child: const Icon(FontAwesomeIcons.whatsapp)
          ),
          ),
        ],
      ),
    );
  }
}

Future<void> launchWhatsAppUri() async {
  String url = "https://api.whatsapp.com/send/?phone=(905346391379)";
  await launchUrl(Uri.parse(url),
      mode: LaunchMode.externalApplication);
}