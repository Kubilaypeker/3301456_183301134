import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotPassword extends StatefulWidget{
  const forgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<forgotPassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double safeAreaHeight = height - padding.top - kToolbarHeight- 50;

    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color(0xFF282828),
        title: Text(
          "Şifremi Unuttum",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 25,left: 8,right: 8),
            child: Text("E-mailinizi girin",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8,20,8,10),
            child: TextFormField(
              controller: email,
              style: TextStyle(color: Colors.white),
              obscureText: false,
              decoration: InputDecoration(
                hintText: "örnek@gmail.com",
                hintStyle: GoogleFonts.poppins(
                  color: Color(0xffA1A2A4),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child:SizedBox(
              width: 2*width/3,
              height: safeAreaHeight/15,
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: email.text)
                      .then((value) => Navigator.of(context).pop());
                },  child: Text("Şifremi Sıfırla",
                style: GoogleFonts.poppins(
                    color: Colors.white
                ),
              ),
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff0E469B),
                  primary: const Color.fromARGB(255, 255, 255, 255),),
              ),
            ),
          )
        ],
      ),
    );
  }
}