import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.only(left: 10, top: 10),
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
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "T-Con",
                  ))
              );
            },
                child: Text("T-Con'lar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Besleme",
                  ))
              );
            },
                child: Text("Beslemeler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Inverter",
                  ))
              );
            },
                child: Text("Inverterler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Askı aparat",
                  ))
              );
            },
                child: Text("Askı Aparatları", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Ekran Koruyucu",
                  ))
              );
            },
              child: Text("Ekran Koruyucular", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Uydu alıcı",
                  ))
              );
            },
              child: Text("Uydu Alıcısı", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Kablo",
                  ))
              );
            },
              child: Text("Kablolar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "LNB",
                  ))
              );
            },
              child: Text("LNB'ler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen(
                    product: "Sarf Malzeme",
                  ))
              );
            },
              child: Text("Sarf Malzemeler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: launchTelegramUri,
              child: Text("Yazılım & Destek", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> launchTelegramUri() async {
  String url = "https://t.me/+9g3oBsEBQCthZDE0";
  await launchUrl(Uri.parse(url),
      mode: LaunchMode.externalApplication);
}