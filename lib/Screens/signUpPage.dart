import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:merkezledapp/Screens/signInPage.dart';
import 'package:merkezledapp/authenticationService.dart';
import 'package:merkezledapp/main.dart';
import 'package:provider/provider.dart';

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                validator: (value) {
                  if(value == null || value.isEmpty || !value.contains('@dpu.edu') || !value.contains('.')){
                    return 'Geçersiz E-mail';
                  }
                  return null;
                },
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                controller: email,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                    hintText: "\tE-mail",
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
                controller: password,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                    hintText: "\tŞifre",
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
                  context.read<AuthenticationService>().signUp(email: email.text, password: password.text);
                  print("KAYIT OLAN KULLANICI" + (FirebaseAuth.instance.currentUser.toString()));
                  showAlertDialog(context);
              },
              child: Text("KAYIT OL",
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
                    MaterialPageRoute(builder: (context) => const loginPage()));
              },
              child: Text("Hesabınız var ise giriş yapın.",
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

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("Tamam",
    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
    ),
    onPressed: () {
      context.read<AuthenticationService>().signOut();
      Navigator.of(context).pop();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AuthenticationWrapper()));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xFF282828),
    title: Lottie.network("https://assets3.lottiefiles.com/private_files/lf30_o0calpsv.json"),
    content: Text("Mail adresinize gelen linki onayladıktan sonra giriş yapabilirsiniz.",
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: Colors.white
    ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}