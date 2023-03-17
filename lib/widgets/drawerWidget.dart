import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/homePage.dart';
import 'package:merkezledapp/Screens/motherboardGridView.dart';
import 'package:merkezledapp/Screens/productPreviewPage.dart';

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
                MaterialPageRoute(builder: (context) => homePage()),
              );
            },
                child: Text("Ana Sayfa", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => productPreviewPage()),
              );
            },
                child: Text("LED'ler", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: TextButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => motherBoardGridViewScreen())
              );
            },
                child: Text("Anakartlar", style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
                )
            ),
          ),
        ],
      ),
    );
  }
}
