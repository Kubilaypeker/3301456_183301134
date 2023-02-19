import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class productPage extends StatefulWidget {
  const productPage({Key? key}) : super(key: key);

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff383737),
      appBar: AppBar(
        backgroundColor: const Color(0xff383737),
        title: Image.asset("assets/merkezLedLogo.png"),
      ),
      body: Stack( children: <Widget>[
        ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: SizedBox(
              width: width-10,
              height: height/3,
              child:Image.asset("assets/led.jpg", fit: BoxFit.contain,)),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text("UE32F5570 D2GE-320SC1 65,8CM ES-035/9 SAMSUNG",
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text("STOKTA VAR",
            style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white70),
                ),
              ),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(
              style: ButtonStyle(
                iconColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green.shade700),
              ),
              onPressed: launchWhatsAppUri,
              child: Row( children: <Widget>[
                const Icon(FontAwesomeIcons.whatsapp),
                Text("\t Whatsapp üzerinden sipariş oluşturun.",
                style: GoogleFonts.inter(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
                )
              ]
              ),
            ),
              )
            ],
          ),
        ]
      )
    );
  }
}

Future<void> launchWhatsAppUri() async {
  String url = "https://api.whatsapp.com/send/?phone=(905346391379)";
  await launchUrl(Uri.parse(url),
      mode: LaunchMode.externalApplication);
}