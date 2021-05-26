import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world/pages/countrydetail.dart';

class modelcard extends StatefulWidget {
  final String text, text1;
  modelcard({Key key, @required this.text, this.text1}) : super(key: key);

  @override
  _modelcardState createState() => _modelcardState();
}

class _modelcardState extends State<modelcard> {
  bool chackfavor = false;
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CountryDetail(
                    txt: widget.text1,
                  )));
        },
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    widget.text,
                    style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      chackfavor ? Icons.favorite : Icons.favorite_border,
                      color: chackfavor ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        chackfavor = !chackfavor;
                      });
                    })
              ],
            ),
          ),
          clipBehavior: Clip.antiAlias,
        ),
      ),
    );
  }
}
