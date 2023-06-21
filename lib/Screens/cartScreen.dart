import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:merkezledapp/authenticationService.dart';
import 'package:merkezledapp/hive_model.dart';
import 'package:merkezledapp/main.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff383737),
      appBar: AppBar(
        backgroundColor: const Color(0xff383737),
        elevation: 0,
        title: Text('Sepetiniz', style: GoogleFonts.poppins(),),
      ),
      body: _buildCartItems(),
    );
  }

  Widget _buildCartItems() {
    final cartItems = context.read<hiveService>().getItemsOnCart(); // Retrieve cart items from Hive

    if(cartItems.isEmpty) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, color: Colors.white, size: 60,),
            Text("Sepetiniz Boş", style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),),
          ],
        ),
      );
    }
    else {
      return Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(product.photoUrl, height: 100, width: 100,),
                    SizedBox(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text(product.marka + "\n\n" + product.kod,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontWeight: FontWeight.w600
                          ),
                        )
                    ),
                    IconButton(icon: Icon(Icons.remove_shopping_cart, color: Colors.white,),
                      onPressed: () {
                        context.read<hiveService>().removeItem(index);
                        setState(() {}); // Refresh the UI after removing an item
                      },
                    ),
                  ],
                ),
              );

            },
          ),
          TextButton(
              onPressed: () {
                showAlertDialog(context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromRGBO(10, 10, 10, 100))
              ),
              child: Text('Siparişi Tamamla', style: GoogleFonts.roboto(color: Colors.white),)
          ),
        ],
      );
    }
  }
}


showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    child: Text("Tamam",
      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: const Color(0xFF282828),
    title: Lottie.asset("assets/orderAnimation.json", repeat: false),
    content: Text("Siparişiniz Hazırlanıyor!",
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.white
      ),
    ),
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