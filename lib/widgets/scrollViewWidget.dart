import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:merkezledapp/Screens/productsGridView.dart';
import 'package:merkezledapp/widgets/productPreviewOnHomePage.dart';

class scrollView extends StatelessWidget {
  scrollView({Key? key, this.marka}) : super(key: key);

  var marka;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text("$marka LEDLER",
                  style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(top:10),
                  child: IconButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => productsGridViewScreen(
                        marka: marka,
                      )),
                    );
                  },
                      icon: const Icon(Icons.arrow_forward, color: Colors.white,))
              ),
            ]
        ),
        productPreview(marka: marka,),
      ],
    );
  }
}
