import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/forgotPassword.dart';
import 'package:merkezledapp/Screens/signUpPage.dart';
import 'package:provider/provider.dart';
import 'package:merkezledapp/authenticationService.dart';


class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => loginPageState();
}

class loginPageState extends State<loginPage> {

  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF282828),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
            height: 200,
            child: Image.asset("assets/logo-no-background.png"),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextFormField(
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                controller: userEmail,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,
                    hintText: "E-mail",
                    hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: TextFormField(
                obscureText: true,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                controller: userPassword,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15),
                    border: InputBorder.none,
                    hintText: "Şifre",
                    hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0E469B))
              ),
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                  email: userEmail.text,
                  password: userPassword.text,
                );
              },
              child: Text("GİRİŞ YAP",
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const signUpScreen()));
              },
              child: Text("Yeni Hesap oluşturun.",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey.shade900)
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const forgotPassword()));
              },
              child: Text("Şifremi Unuttum",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}