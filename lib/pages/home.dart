import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:world/pages/detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool mode = false;
  List data;

  Future<String> LoadJsonData() async {
    var jsontext = await rootBundle.loadString('asset/continents.json');
    setState(() {
      data = json.decode(jsontext);
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
          'world',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [
            //Text(data[0]["AF"]),
            Expanded(
              child: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var Africa = data[index]["AF"];
                    var Antarctic = data[index]["AN"];
                    var Asia = data[index]["AS"];
                    var Europe = data[index]["EU"];
                    var NorthAmerica = data[index]["NA"];
                    var Oceania = data[index]["OC"];
                    var SouthAmerica = data[index]["SA"];
                    print(Africa);
                    print(Antarctic);
                    print(Asia);
                    print(Europe);
                    print(NorthAmerica);
                    print(Oceania);
                    print(SouthAmerica);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        model(Africa, 'image/africa.jpg', context),
                        model(Antarctic, 'image/antarctica.jpg', context),
                        model(Asia, 'image/asia.png', context),
                        model(Europe, 'image/europe.jpg', context),
                        model(NorthAmerica, 'image/na.png', context),
                        model(Oceania, 'image/oceania.jpg', context),
                        model(SouthAmerica, 'image/south-america.png', context),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    image: DecorationImage(
                      image: AssetImage('image/world-tour.png'),
                      fit: BoxFit.fitHeight,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                )),
            ListTile(
              title: Text('Dark Mode'),
              leading: Switch(
                value: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value;
                  });
                },
                activeTrackColor: Colors.greenAccent,
                activeColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget model(String s, String m, context) {
  return InkWell(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Detail()));
    },
    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              m,
              fit: BoxFit.cover,
              height: 160.0,
              width: 150.0,
            ),
            Text(
              s,
              style: GoogleFonts.ubuntu(
                  textStyle:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
            )
          ],
        ),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(8.0),
    ),
  );
}
