import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;



  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    print("kullnıcı: $_firebaseAuth.currentUser");
  }


  Future<String?> signIn({required String email, required String password}) async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch  (e) {
      if(e.code == "invalid-email") {
        print("Hata kodu: "+ e.code);
        Fluttertoast.showToast(msg: "Lütfen geçerli bir e-mail adresi giriniz.");
      }
      else if(e.code == "user-not-found") {
        print("Hata kodu: "+ e.code);
        Fluttertoast.showToast(msg: "Kullanıcı bulunamadı!");
      }
      else if(e.code == "wrong-password") {
        print("Hata kodu: "+ e.code);
        Fluttertoast.showToast(msg: "Kullanıcı adı ve şifrenizi kontrol ederek tekrar deneyiniz.");
      }
    }
  }

  Future<void> verifyUser() async {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<String?> signUp({required String email, required String password}) async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      print("kullnıcı: $_firebaseAuth.currentUser");
      return "Kayıt Oldunuz";
    } on FirebaseAuthException catch (e) {
      print("HATA KODU:" + e.code);
      return e.message;
    }
  }
}