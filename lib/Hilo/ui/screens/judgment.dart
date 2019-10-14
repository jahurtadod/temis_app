import 'package:flutter/material.dart';
import 'package:temis_app/Hilo/model/hilo.dart';
import 'package:temis_app/User/ui/screens/seleccionCaso.dart';

class JudgmentScreen extends StatefulWidget {
  final Judgment judgament;

  JudgmentScreen({Key key, this.judgament}) : super(key: key);

  @override
  _JudgmentScreenState createState() => _JudgmentScreenState();
}

class _JudgmentScreenState extends State<JudgmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100),
                // padding: EdgeInsets.symmetric(
                //     horizontal: MediaQuery.of(context).size.width / 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        "Sentencia",
                        style:
                            TextStyle(color: Color(0xff00adb5), fontSize: 32),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://i.pravatar.cc/150?img=26"),
                        backgroundColor: Colors.grey[200],
                        minRadius: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50, bottom: 50),
                child: Text(widget.judgament.description,
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 16,
                    )),
              ),
              Container(
                child: Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.judgament.resolution,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffffba10),
                        fontSize: 18,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
                // child: Text(
                //   widget.judgament.resolution,
                //   style: TextStyle(
                //     color: Color(0xffffba10),
                //     fontSize: 24,
                //     letterSpacing: 3,
                //   ),
                // ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 25),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.height * 0.25,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SelectCase()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Container(
                      child: Text(
                    "Finalizar",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1,
                      color: Color(0xff00adb5),
                    ),
                  )),
                  borderSide: BorderSide(
                    color: Color(0xff00adb5), //Color of the border
                    style: BorderStyle.solid, //Style of the border
                    width: 1, //width of the border
                  ),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //     body: SafeArea(
    //         child: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: <Widget>[
    //       Expanded(
    //         child: Container(),
    //       ),
    //       Text(
    //         "Audiencia 1",
    //         textAlign: TextAlign.left,
    //         style: const TextStyle(
    //             color: Colors.grey,
    //             fontFamily: "Comfortaa",
    //             fontWeight: FontWeight.w400,
    //             fontStyle: FontStyle.normal,
    //             fontSize: 36.0),
    //       ),
    //       Text(widget.judgament.resolution),
    //       Text(widget.judgament.description),
    //       Expanded(
    //         child: Container(),
    //       ),
    //       Text("Finalizar",
    //           style: const TextStyle(
    //               color: const Color(0xff00adb5),
    //               fontWeight: FontWeight.w400,
    //               fontFamily: "Comfortaa",
    //               fontStyle: FontStyle.normal,
    //               fontSize: 25.0),
    //           textAlign: TextAlign.left),
    //     ],
    //   ),
    // )));
  }
}
