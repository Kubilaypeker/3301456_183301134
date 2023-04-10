import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productPage.dart';

class product extends StatelessWidget {
  product({Key? key, this.uzunluk, this.set, this.model, this.led, this.kod, this.image, this.fiyat,}) : super(key: key);

  var model, kod, set, uzunluk, image, fiyat, led;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
        child: Container(
      decoration: BoxDecoration(
        color: Colors.black12,
      ),
        child: SizedBox(
      height: 190,
        width: (width-10)/2,
        child: IconButton(
            onPressed: () {
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
          height: 120,
            child: Image.network(image,)
        ),
        SizedBox(
          height: 50,
          child:Text(model,
        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        ),
        Container(
          padding: EdgeInsets.only(top: 5),
          child: SizedBox(
          height: 20,
          child:Text("Fiyat: $fiyat₺",
            style: GoogleFonts.inter(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 13)
                     ),
                    ),
                  ),
                ],
              )
            )
          )
        ),
    );
  }
}
