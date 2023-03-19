import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:merkezledapp/widgets/searchingPreviewWidget.dart';

class searchStreamBuilder extends StatefulWidget {
   searchStreamBuilder({Key? key, required this.model, required this.modelName}) : super(key: key);

   var model, modelName;

  @override
  State<searchStreamBuilder> createState() => _searchStreamBuilderState();
}

class _searchStreamBuilderState extends State<searchStreamBuilder> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot> (
      stream: FirebaseFirestore.instance.collection("Ledler").doc("gR54jNsQR0XrpFZIg1bk").collection(widget.model).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
        return (querySnapshot.connectionState == ConnectionState.waiting)
            ? const SizedBox(
          height: 0
        )
            : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: querySnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = querySnapshot.data!.docs[index].data() as Map<String, dynamic>;
              final DocumentSnapshot documentSnapshot = querySnapshot.data!.docs[index];

              if(widget.modelName.isEmpty) {
                return const SizedBox(height: 0);
              }
              if(data['Model'].toString().toLowerCase().contains(widget.modelName)) {
                return searchWidget(
                  model: documentSnapshot["Model"],
                  image: documentSnapshot["image"],
                  uzunluk: documentSnapshot["Uzunluk"],
                  kod: documentSnapshot["Kod"],
                  set: documentSnapshot["Set"],
                  fiyat: documentSnapshot["Fiyat"],
                  led: documentSnapshot["Led"],
                );
              }
            }
        );
      },
    );
  }
}
