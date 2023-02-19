import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/widgets/productPreviewOnHomePage.dart';
import 'package:url_launcher/url_launcher.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff383737),
      appBar: AppBar(
        backgroundColor: const Color(0xff383737),
        centerTitle: true,
        title: Image.asset("assets/merkezLedLogo.png"),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                  prefixIcon: const Icon(Icons.search, color: Colors.black,),
                  placeholder: "Aradığınız ürünü giriniz",
                  placeholderStyle: GoogleFonts.inter(color: Colors.black),
                ),

      ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text("Öne Çıkan Ürünler",
                    style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
                    Container(
                      padding: const EdgeInsets.only(top:10),
                        child: IconButton(onPressed: () {},
                        icon: const Icon(Icons.arrow_forward,))
                    ),
                  ]
              ),
              productPreview(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text("LED'ler",
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top:10),
                        child: IconButton(onPressed: () {},
                            icon: const Icon(Icons.arrow_forward,))
                    ),
                  ]
              ),
              productPreview(),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text("Anakartlar",
                        style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top:10),
                        child: IconButton(onPressed: () {},
                            icon: const Icon(Icons.arrow_forward,))
                    ),
                  ]
              ),
              const productPreview()
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