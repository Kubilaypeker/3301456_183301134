import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:merkezledapp/Screens/signInPage.dart';
import 'package:merkezledapp/authenticationService.dart';
import 'package:merkezledapp/firebase_options.dart';
import 'package:merkezledapp/hive_model.dart';
import 'package:provider/provider.dart';
import 'Screens/productPreviewPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter()); // Add this line to register the adapter for the Product class
  await Hive.openBox('shopping_cart');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        StreamProvider(create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        ),
        Provider<hiveService>(
          create: (_) => hiveService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget { // to check user already signed in
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null && firebaseUser.emailVerified == true) {
      return const productPreviewPage();
    }
    else if(firebaseUser?.emailVerified == false) {
      Fluttertoast.showToast(msg: "E-mail adresinizi onaylayın.");
      context.read<AuthenticationService>().verifyUser();
      context.read<AuthenticationService>().signOut();
    }
    return const loginPage();
  }
}

