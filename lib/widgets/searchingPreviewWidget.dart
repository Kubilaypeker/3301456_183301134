import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productPage.dart';

class searchWidget extends StatelessWidget {
  searchWidget({Key? key, this.uzunluk, this.image, this.model, this.fiyat, this.kod, this.led, this.set}) : super(key: key);

  var fiyat, uzunluk, kod, set, model, image, led;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(color: Colors.black12)),
        backgroundColor: MaterialStateProperty.all(Colors.grey.shade900.withOpacity(1))
      ),
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
      child: ListTile(
        leading: Image.network(image, fit: BoxFit.cover,),
        title: Text(model, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),),
        subtitle: Text(kod, style: GoogleFonts.poppins(color: Colors.white38),),
      )
    );
  }
}
