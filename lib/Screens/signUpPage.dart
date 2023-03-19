import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:merkezledapp/Screens/signInPage.dart';
import 'package:merkezledapp/authenticationService.dart';
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                controller: email,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                    hintText: "\tE-mail",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                controller: password,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                    hintText: "\tŞifre",
                    hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)
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
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value) {print("Hesabınız Oluşturuldu!");
                  context.read<AuthenticationService>().verifyUser();
                  context.read<AuthenticationService>().signOut();
                  showAlertDialog(context);
                }
                );
              },
              child: const Text("KAYIT OL",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const loginPage()));
              },
              child: const Text("Hesabınız var ise giriş yapın.",
                style: TextStyle(
                    color: Color(0xff0E469B)
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
    child: Text("Tamam"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hesabınız Oluşturuldu!"),
    content: Text("Mail adresinize gelen linki onaylandıktan sonra giriş yapabilirsiniz."),
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