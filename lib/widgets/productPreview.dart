import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productPage.dart';

class product extends StatelessWidget {
  const product({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(padding: const EdgeInsets.only(left: 5),
        child: SizedBox(
      height: 2*height/7,
        width: (width-10)/2,
        child: IconButton( onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => productPage()),
          );
        },
        icon:Column(
      children: <Widget>[
        Image.asset("assets/led.jpg", fit: BoxFit.fill,),
        Text("UE32F5570 D2GE-320SC1 65,8CM ES-035/9 SAMSUNG",
        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    ))
    ));
  }
}
