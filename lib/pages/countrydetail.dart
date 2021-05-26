import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class CountryDetail extends StatefulWidget {
  final String txt;
  CountryDetail({Key key, @required this.txt}) : super(key: key);
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  Map<String, dynamic> data;

  Future<String> LoadJsonData() async {
    var jsontext = await rootBundle.loadString('asset/data.json');
    setState(() {
      Map<String, dynamic> map = json.decode(jsontext);
      data = map["countries"][widget.txt];
      //print(data);
      return 'success';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await LoadJsonData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'countries',
          style: GoogleFonts.ubuntu(
              textStyle:
                  TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * (4 / 5),
          width: MediaQuery.of(context).size.width * (4 / 5),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      info((data["name"]), 30.0),
                      SizedBox(
                        height: 25.0,
                      ),
                      info("The Emoji : " + data["emoji"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The Native : " + data["native"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The Phone : " + data["phone"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The Continent : " + data["continent"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The Capital : " + data["capital"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The Currency : " + data["currency"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The Languages : " + data["languages"][0], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                      info("The EmojiU : " + data["emojiU"], 20.0),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget info(String s, double num) {
  return Text(
    s,
    style: GoogleFonts.ubuntu(
        textStyle: TextStyle(fontSize: num, fontWeight: FontWeight.bold)),
  );
}
