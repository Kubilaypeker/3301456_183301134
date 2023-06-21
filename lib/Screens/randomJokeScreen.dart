import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';


class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({Key? key}) : super(key: key);

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  var jsonList;
  final dio = Dio();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }

  getHttp() async {
    try {
      var response = await dio.get('https://api.nytimes.com/svc/news/v3/content/nyt/technology.json?api-key=DesxIrwdSrHhaVkvBz6hbWncqxEbmprq');
      if(response.statusCode == 200){
        setState(() {
          jsonList = response.data['results'] as List;
        });
      }
      else{
        print(response.statusCode);
      }
    }catch(e){
      print(e);
    }
  }



  String modelNameText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("NY Times",
            style: GoogleFonts.montserrat(
                color: Colors.black
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: jsonList == null?0:jsonList.length,
                itemBuilder: (BuildContext context, int index) {
                  return newsPreview(
                    caption: jsonList[index]['title'],
                    imageUrl: jsonList[index]['multimedia']?[2]['url'],
                    content: jsonList[index]['abstract'],
                  );
                }
            ),
            Column(
                children: [
                  CupertinoSearchTextField(
                    onChanged: (searchText) {
                      setState  (() {
                        modelNameText = searchText;
                      });
                    },
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                    ),
                    prefixIcon: const Icon(Icons.search, color: Colors.black,),
                    placeholder: "Search for your interest",
                    placeholderStyle: GoogleFonts.inter(color: Colors.black),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: jsonList == null?0:jsonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          if(modelNameText.isEmpty){
                            return const SizedBox(height: 0,);
                          }
                          else if(jsonList[index]['title'].toString().toLowerCase().contains(modelNameText)){
                            return searchResult(
                              title: jsonList[index]['title'],
                              imageUrl: jsonList[index]['multimedia']?[2]['url'],
                              content: jsonList[index]['abstract'],
                            );
                          }
                          else if(modelNameText.isEmpty){
                            return const SizedBox(height: 0,);
                          }
                          else {
                            return const SizedBox(height: 0,);
                          }
                        }
                    ),
                  ),
                ]
            ),
          ],
        )
    );
  }
}

class searchResult extends StatelessWidget {
  searchResult({Key? key, this.content, this.imageUrl, this.title}) : super(key: key);

  var imageUrl, title, content;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(const BorderSide(color: Colors.black12)),
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade900.withOpacity(1))
        ),
        onPressed: () {

        },
        child: ListTile(
          leading: imageUrl != null ? Image.network(imageUrl, fit: BoxFit.fill,) : const CircularProgressIndicator(color: Colors.white38),
          title: Text(title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600),),
        )
    );
  }
}

class newsPreview extends StatelessWidget {
  newsPreview({Key? key, this.caption, this.imageUrl, this.content}) : super(key: key);

  var imageUrl, caption, content;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {

      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: imageUrl != null ? Image.network(imageUrl, fit: BoxFit.fill,) : Center(
                child:Text(
                  "Image is not found",
                  style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent, Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0, 0, 0, 0.9]
                ),
              ),
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              child: Text(caption,
                style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),),
            ),
          ],
        ),
      ),
    );
  }
}