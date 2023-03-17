import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productPage.dart';

class product extends StatelessWidget {
  product({Key? key, this.uzunluk, this.set, this.model, this.led, this.kod, this.image, this.fiyat}) : super(key: key);

  var model, kod, set, uzunluk, image, fiyat, led;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.black12, borderRadius: BorderRadius.circular(10)
      ),
        child: SizedBox(
      height: height/3,
        width: (width-10)/2,
        child: IconButton( onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => productPage(
              image: image,
              fiyat: fiyat,
              model: model,
              kod: kod,
              set: set,
              uzunluk: uzunluk,
              led: led,
            )),
          );
        },
        icon:Column(
      children: <Widget>[
        Container(
          height: 180,
            child: Image.network(image,)
        ),
        Text(model,
        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    ))
    ));
  }
}
