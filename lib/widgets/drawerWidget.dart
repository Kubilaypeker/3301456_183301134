import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/motherboardGridView.dart';
import 'package:merkezledapp/Screens/productPreviewPage.dart';
import 'package:url_launcher/url_launcher.dart';

class drawerWidget extends StatelessWidget {
  const drawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(width: MediaQuery.of(context).size.width/2,
      backgroundColor: const Color(0xff383737),
      child: ListView(
        children: <Widget>[
          SizedBox(
              height: 45,
              child: Image.asset('assets/logo-no-background.png',)
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => productPreviewPage()),
              );
            },
                child: Text("TV LED Bar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Ekran Koruyucuları",
                  ))
              );
            },
              child: Text("Ekran Koruyucular", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Uydu alıcıları",
                  ))
              );
            },
              child: Text("Uydu Alıcısı", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "LNB'ler",
                  ))
              );
            },
              child: Text("LNB'ler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Askı aparatları",
                  ))
              );
            },
              child: Text("Askı Aparatları", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Kablolar",
                  ))
              );
            },
              child: Text("Kablolar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Anakartlar",
                  ))
              );
            },
                child: Text("Anakartlar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Beslemeler",
                  ))
              );
            },
                child: Text("Beslemeler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Inverterlar",
                  ))
              );
            },
                child: Text("Inverterler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "T-Con'lar",
                  ))
              );
            },
                child: Text("T-Con'lar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Adaptörler",
                  ))
              );
            },
                child: Text("Adaptörler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Sarf Malzemeler",
                  ))
              );
            },
              child: Text("Sarf Malzemeler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: TextButton(onPressed: launchTelegramUri,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                  children: [
                Icon(FontAwesomeIcons.telegram, size: 30,),
                Text("Yazılım & Destek", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
              ),
              ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> launchTelegramUri() async {
  String url = "https://t.me/+905346391379";
  await launchUrl(Uri.parse(url),
      mode: LaunchMode.externalApplication);
}