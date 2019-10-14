import 'package:flutter/material.dart';
import 'package:temis_app/Hilo/model/hilo.dart';
import 'package:temis_app/Hilo/repository/dataTempHilo.dart';
import 'package:temis_app/Hilo/ui/screens/chatCaso.dart';

class AudiencePage extends StatefulWidget {
  final Hilo hilo;

  AudiencePage({Key key, @required this.hilo}) : super(key: key);

  @override
  _AudiencePageState createState() => _AudiencePageState();
}

class _AudiencePageState extends State<AudiencePage> {
  String myRole;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [
            0.1,
            0.6
          ],
              colors: [
            Color(0xFF00ACC1),
            Color(0xFFFFFFFF),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: const Color(0xff00a4c2)),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  // Hero(
                  //   tag: 'audience',
                  //   child: Container(
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 200,
                  //       decoration: BoxDecoration(
                  //         color: const Color(0xff00adb5),
                  //         image: DecorationImage(
                  //           image: NetworkImage(
                  //               "https://images.unsplash.com/photo-1414919823178-e9d9d0afd0ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1746&q=80"),
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                      // padding: EdgeInsets.only(top: 70, left: 0),
                      child: Container(
                    width: 275,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: const Color(0xff23374d)),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(widget.hilo.title,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                //fontWeight: FontWeight.w400,
                                fontFamily: "Comfortaa",
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0),
                            textAlign: TextAlign.left),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            "Audiencia 1",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Comfortaa",
                                fontStyle: FontStyle.normal,
                                fontSize: 16.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Text(widget.hilo.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 9,
                            style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                                fontFamily: "Nunito",
                                fontStyle: FontStyle.normal,
                                fontSize: 13),
                            textAlign: TextAlign.left),
                      )
                    ]),
                  )),
                ],
              ),
              Spacer(),
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Selecciona un rol:",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: const Color(0xff243043),
                    ),
                    width: 90,
                    height: 90,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatCaso(
                                      storage: CounterStorage(
                                          caso: "${widget.hilo.title}_juez"),
                                      myRole: "Juez",
                                      hilo: widget.hilo,
                                    )));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: const Color(0xff00adb5),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i.pravatar.cc/150?img=26"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Juez",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontFamily: "Comfortaa",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15),
                              textAlign: TextAlign.left),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: const Color(0xff243043),
                    ),
                    width: 90,
                    height: 90,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatCaso(
                                      storage: CounterStorage(
                                          caso: "${widget.hilo.title}_defensa"),
                                      myRole: "Defensa",
                                      hilo: widget.hilo,
                                    )));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: const Color(0xff00adb5),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i.pravatar.cc/150?img=61"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Defensa",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontFamily: "Comfortaa",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15),
                              textAlign: TextAlign.left),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: const Color(0xff243043),
                    ),
                    width: 90,
                    height: 90,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatCaso(
                                      storage: CounterStorage(
                                          caso:
                                              "${widget.hilo.title}_fiscalia"),
                                      myRole: "Fiscalía",
                                      hilo: widget.hilo,
                                    )));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: const Color(0xff00adb5),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://i.pravatar.cc/150?img=59"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Fiscalia",
                              style: const TextStyle(
                                  color: const Color(0xffffffff),
                                  fontFamily: "Comfortaa",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15),
                              textAlign: TextAlign.left),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
