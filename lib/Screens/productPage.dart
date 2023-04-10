import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class productPage extends StatelessWidget {
  productPage({Key? key, this.uzunluk, this.image, this.model, this.fiyat, this.kod, this.led, this.set,}) : super(key: key);

  var fiyat, uzunluk, kod, set, model, image, led;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff383737),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xff383737),
        centerTitle: true,
        title: SizedBox(
            height: 50,
            child: Image.asset("assets/logo-no-background.png")),
      ),
      body: Stack( children: <Widget>[
        ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SizedBox(
              width: width-10,
              height: height/3,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12)
                ),
                  child: Image.network(image),
                  onPressed: () {
                    showImageViewer(
                        context,
                        Image.network(image)
                            .image,
                        swipeDismissible: true,
                        doubleTapZoomable: true);
                  }),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(model,
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text("STOKTA VAR",
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white70),
                ),
              ),
          Padding(padding: const EdgeInsets.only(left: 10, top: 10,),
            child: Text("KOD: $kod",
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 10, top: 10,),
            child: Text("SET: $set",
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 10, top: 10,),
            child: Text("LED SAYISI: $led",
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 10, top: 10,),
            child: Text("UZUNLUK: $uzunluk",
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 10, top: 10,),
            child: Text("FİYAT: $fiyat₺",
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
            child: TextButton(
              style: ButtonStyle(
                iconColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade700),
              ),
              onPressed: () {
                launchWhatsAppUri(model);
    },
              child: Row(
                  children: <Widget>[
                const Icon(FontAwesomeIcons.whatsapp),
                Text("\t Whatsapp üzerinden sipariş oluşturun.",
                style: GoogleFonts.inter(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ]
              ),
            ),
              ),
          SizedBox(height: 80,),
            ],
          ),
        ]
      )
    );
  }
}

Future<void> launchWhatsAppUri(String model) async {
  String url = "https://api.whatsapp.com/send/?phone=(905346391379)&text=$model+ ile ilgili bilgi almak istiyorum.";
  await launchUrl(Uri.parse(url),
      mode: LaunchMode.externalApplication);
}