import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/motherBoardPage.dart';
import 'package:merkezledapp/Screens/productPage.dart';

class motherBoardProduct extends StatelessWidget {
  motherBoardProduct({Key? key, this.model, this.marka, this.kod, this.image, this.fiyat}) : super(key: key);

  var model, kod, image, fiyat, marka;

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
                MaterialPageRoute(builder: (context) => motherBoardPage(
                  image: image,
                  model: model,
                  fiyat: fiyat,
                  kod: kod,
                  marka: marka,
                )),
              );
            },
                icon:Column(
                  children: <Widget>[
                    Container(
                        height: 180,
                        child: Image.network(image,)
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Text(model,
                        style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(0),
                      child: Text("Fiyat: $fiyat₺",
                          style: GoogleFonts.inter(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 13)
                      ),
                    ),
                  ],
                ),
            ),
        ));
  }
}
