import 'package:flutter/material.dart';
import 'package:temis_app/Hilo/model/hilo.dart';
import 'package:temis_app/Hilo/repository/storageApi.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:temis_app/Hilo/ui/screens/pageCaso.dart';

import 'infomationPage.dart';

class SelectCase extends StatefulWidget {
  @override
  _SelectCaseState createState() => new _SelectCaseState();
}

class _SelectCaseState extends State<SelectCase> {
  Hilo hilo;
  final StorageApi api = new StorageApi();

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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoPage()));
                      },
                      icon: Icon(
                        Icons.help,
                        color: Color(0xff00adb5),
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Color(0xff00adb5),
                    fontSize: 30.0,
                    fontFamily: "Calibre-Semibold",
                    letterSpacing: 2,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: "TEMIS "),
                    TextSpan(
                      text: "ASCENDERE",
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: "Comfortaa",
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Text("Audencias:", style: TextStyle(fontSize: 20)),
                    Spacer(),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 6.0),
                              child: Text("Disponibles",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  child: Container(
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height / 2.2,
                    width: 225,
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        child: Text("Formulación de cargos",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontFamily:
                                                    "SF-Pro-Text-Regular")),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.0, bottom: 12.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 22.0, vertical: 6.0),
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(20.0)),
                                          child: Text("JUGAR",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1414919823178-e9d9d0afd0ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1746&q=80"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    api.getHilo().then((resp) {
                      this.hilo = resp;
                    }).catchError((err) {
                      print("caught $err");
                    }).whenComplete(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AudiencePage(hilo: this.hilo)));
                    });
                  },
                ),
              ),
              // Hero(
              //   tag: 'audience',
              //   child: Container(
              //     color: Colors.transparent,
              //     height: 300,
              //     width: 200,
              //     child: Stack(
              //       children: <Widget>[
              //         ClipRRect(
              //           borderRadius: BorderRadius.circular(20),
              //           child: Container(
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image: NetworkImage(
              //                     "https://images.unsplash.com/photo-1414919823178-e9d9d0afd0ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1746&q=80"),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ChatCaso(
              //                   storage: CounterStorage(),
              //                 )));
              //   },
              //   child: Container(
              //     padding: EdgeInsets.only(top: 50, bottom: 50),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Container(
              //           width: 250,
              //           height: 250,
              //           child: ClipRRect(
              //               borderRadius: BorderRadius.circular(20.0),
              //               child: Image.network(
              //                   "https://images.unsplash.com/photo-1414919823178-e9d9d0afd0ac?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1746&q=80")),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding:
                    EdgeInsets.only(top: 25, left: 30, right: 30, bottom: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text("Tú Progreso:",
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 25, bottom: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Spacer(),
              //       Text("Tú Progreso:",
              //           style: TextStyle(fontSize: 25, color: Colors.white)),
              //       Spacer(),
              //       Row(
              //         children: <Widget>[
              //           Container(
              //             decoration: BoxDecoration(
              //               color: Colors.grey,
              //               borderRadius: BorderRadius.circular(20.0),
              //             ),
              //             child: Center(
              //               child: Padding(
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal: 22.0, vertical: 6.0),
              //                 child: Text("Disponibles",
              //                     style: TextStyle(color: Colors.white)),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       Spacer(),
              //     ],
              //   ),
              // ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 8),
                child: FAProgressBar(
                  currentValue: 20,
                  size: 20,
                  borderRadius: 40,
                  maxValue: 150,
                  changeColorValue: 100,
                  changeProgressColor: Colors.pink,
                  backgroundColor: Colors.white,
                  progressColor: Color(0xffffd700),
                  animatedDuration: const Duration(milliseconds: 300),
                  direction: Axis.horizontal,
                  verticalDirection: VerticalDirection.up,
                ),
              ),
              // FAProgressBar(
              //   currentValue: 20,
              //   size: 25,
              //   borderRadius: 40,
              //   maxValue: 150,
              //   changeColorValue: 100,
              //   changeProgressColor: Colors.pink,
              //   backgroundColor: Colors.white,
              //   progressColor: Colors.lightBlue,
              //   animatedDuration: const Duration(milliseconds: 300),
              //   direction: Axis.horizontal,
              //   verticalDirection: VerticalDirection.up,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
