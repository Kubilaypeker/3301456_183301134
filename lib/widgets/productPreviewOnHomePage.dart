import 'package:flutter/material.dart';
import 'package:merkezledapp/widgets/productPreview.dart';

class productPreview extends StatelessWidget {
  const productPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: const <Widget>[
        product(),
        product(),
        product(),
        product(),
        product(),
        product(),
        product(),
        product(),
        product(),

      ],
      )
    );
  }
}
