import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world/modelcard.dart';

class Detail extends StatefulWidget {
  final String text;
  Detail({Key key, @required this.text}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  List data;
  List abbreviation;
  Future<String> LoadJsonData() async {
    var jsontext =
        await rootBundle.loadString('asset/country-by-continent.json');
    setState(() {
      data = json.decode(jsontext);

      return 'success';
    });
  }

  Future<String> LoadJsonData1() async {
    var jsontext =
        await rootBundle.loadString('asset/country-by-abbreviation.json');
    setState(() {
      abbreviation = json.decode(jsontext);

      return 'success';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await LoadJsonData();
      await LoadJsonData1();
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
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var name = data[index]["country"];
                    var chackcountries = data[index]["continent"];
                    var abbre = abbreviation[index]["abbreviation"];
                    var abbcountry = abbreviation[index]["country"];
                    return Column(
                      children: [
                        if (chackcountries == widget.text)
                          if (abbcountry == name)
                            modelcard(
                              text: name,
                              text1: abbre,
                            ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
