import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/motherboardGridView.dart';
import 'package:merkezledapp/Screens/productPreviewPage.dart';
import 'package:merkezledapp/authenticationService.dart';
import 'package:merkezledapp/main.dart';
import 'package:merkezledapp/widgets/drawerWidget.dart';
import 'package:provider/provider.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff383737),
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color(0xff383737),
        centerTitle: true,
        title: SizedBox(
            height: 50,
            child: Image.asset('assets/logo-no-background.png',)
        ),
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/merkezledkart.jpg"),
          ),
          Container(
            child: TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-20, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => productPreviewPage()),
                );
              },
            child: Text("LED'ler", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width-20, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => motherBoardGridViewScreen())
                );
              },
              child: Text("Anakartlar", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
