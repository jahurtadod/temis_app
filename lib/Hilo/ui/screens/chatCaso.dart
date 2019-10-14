import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temis_app/Hilo/model/hilo.dart';
import 'package:temis_app/Hilo/model/routeCurrent.dart';
import 'package:temis_app/Hilo/repository/storageApi.dart';
import 'package:temis_app/Hilo/repository/dataTempHilo.dart';
import 'package:temis_app/Hilo/ui/screens/judgment.dart';
import 'package:temis_app/Hilo/ui/widgets/bubbleChat.dart';

class ChatCaso extends StatefulWidget {
  final CounterStorage storage;
  final String myRole;
  final Hilo hilo;

  ChatCaso(
      {Key key,
      @required this.storage,
      @required this.myRole,
      @required this.hilo})
      : super(key: key);

  @override
  _ChatCasoState createState() => _ChatCasoState();
}

class _ChatCasoState extends State<ChatCaso> {
  int _progress = 1;
  List<BubbleChat> _message = <BubbleChat>[];
  List<RouteCurrent> _tempHilo = <RouteCurrent>[];
  int _tempRoute;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounterTemp().then((resp) {
      setState(() {
        this._tempHilo = resp;

        for (var i = 0; i < _tempHilo.length; i++) {
          _message.insert(
              i,
              BubbleChat(
                message: _tempHilo[i].text,
                isMe: _tempHilo[i].type,
                role: _tempHilo[i].role,
              ));
        }
        // for (var item in _tempHilo) {
        //   _printMensajeTemp(item.text, item.role, item.type);
        // }
      });
    });
    // widget.storage.readCounter().then((resp) {
    //   setState(() {
    //     this._message = resp;
    //   });
    // });
    _loadCounter();
    this._tempRoute = _selectRole();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _progress = (prefs.getInt('${widget.hilo.title}_${widget.myRole}') ?? 1);
      this.i = _progress;
      print("progress $_progress");
      print(this.i);
    });
  }

  _resetProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _message.clear();
      _progress = this.i = 1;
      prefs.setInt('${widget.hilo.title}_${widget.myRole}', _progress);
    });
    widget.storage.resetRoute();
  }

  _saveProgress(int saveId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _progress = saveId;
      prefs.setInt('${widget.hilo.title}_${widget.myRole}', _progress);
    });
    widget.storage.writeCounter(_tempHilo);
  }

  bool visibilityNext = false;
  Hilo hilo;
  final StorageApi api = StorageApi();
  String caso = "caso1";
  String myRole;
  int i = 1;
  int selectedItem = 0;

  void _showDialog() {
    final _showToast2 = () => Fluttertoast.showToast(
          msg: "Audencia Restablecida",
          toastLength: Toast.LENGTH_SHORT,
        );
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          elevation: 0.0,
          contentPadding: EdgeInsets.fromLTRB(23, 23, 23, 0),
          title: new Text("Restablecer Progreso",
              style: TextStyle(color: Color(0xff00adb5))),
          content: new Text(
              "Se elimina cada una de las decisiones y comienza el caso desde el comienzo"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Cancelar",
                style: TextStyle(
                  color: Color(0xff00adb5),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text(
                "Continuar",
                style: TextStyle(
                  color: Color(0xff00adb5),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _resetProgress();
                _showToast2();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _showToast = () => Fluttertoast.showToast(
          msg: "Progreso Guardado",
          toastLength: Toast.LENGTH_SHORT,
        );
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff00adb5)),
        centerTitle: true,
        elevation: 0.4,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            // Container(
            //   width: 40,
            //   height: 40,
            //   margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
            //   child: CircleAvatar(
            //     backgroundImage: NetworkImage('https://i.pravatar.cc/250'),
            //     backgroundColor: Colors.grey[200],
            //     minRadius: 30,
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'PROCESO JUDICIAL',
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                Text(
                  'Audencia 1',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _saveProgress(this.i);
              _showToast();
            },
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              _showDialog();
            },
            icon: Icon(Icons.restore),
          ),
        ],
      ),
      body: Container(
        color: Color(0xfff5f5f5),
        child: Column(
          children: <Widget>[
            // FutureBuilder<Hilo>(
            //   future: api.getHilo(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return Text("hola");
            //     }
            //   },
            // ),
            Flexible(
              child: ListView.builder(
                itemCount: _message.length,
                reverse: true,
                itemBuilder: (_, int index) => _message[index],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  // FlatButton(
                  //   onPressed: () {
                  //     _cargarCaso();
                  //   },
                  //   child: Text("CARGAR CASO"),
                  // ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  // Expanded(
                  //   child: TextFormField(
                  //     keyboardType: TextInputType.text,
                  //     decoration: InputDecoration(
                  //       hintText: 'Enter Message',
                  //       border: InputBorder.none,
                  //     ),
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () => _siguienteMensaje(),
                  //   icon: Icon(
                  //     Icons.send,
                  //     color: Color(0xff3E8DF3),
                  //   ),
                  // ),
                  FlatButton(
                    textColor: Color(0xff00adb5),
                    onPressed: () => _selectEvent(),
                    child: Text(
                      "SIGUIENTE",
                      style: const TextStyle(
                        color: Color(0xff00adb5),
                        fontFamily: "Comfortaa",
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  // CupertinoButton(
                  //   child: Text("Press Me"),
                  //   //color: CupertinoColors.activeBlue,
                  //   onPressed: () async {
                  //     await showModalBottomSheet<int>(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return _buildItemPicker();
                  //       },
                  //     );
                  //     print("Hello Printed");
                  //     print("joder: $selectedItem");
                  //     _printMensaje(this.items[selectedItem]);
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _printMensaje(String tempText, String tempRole, bool isMe) {
    BubbleChat message = new BubbleChat(
      message: tempText,
      isMe: isMe,
      role: tempRole,
      myRole: widget.myRole,
    );
    _tempHilo.insert(
        0, RouteCurrent(text: tempText, type: isMe, role: tempRole));
    setState(() {
      _message.insert(0, message);
    });
  }

  int _selectRole() {
    return widget.hilo.route.indexWhere((route) => route.role == widget.myRole);
  }

  void _selectEvent() async {
    print("hilo:  $_message");

    final tempId = widget.hilo.route[this._tempRoute].event
        .indexWhere((event) => event.id == this.i);

    if (widget.hilo.route[this._tempRoute].event[tempId].option != null) {
      await showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              setState(() => selectedItem = -1);
              return true;
            },
            child: _buildItem(
                widget.hilo.route[this._tempRoute].event[tempId].option),
          );
        },
      );
      // await showModalBottomSheet<int>(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return _buildItemPicker(widget.hilo.route[this._tempRoute].event[tempId].option);
      //   },
      // );
      if (selectedItem >= 0) {
        _printMensaje(
            widget.hilo.route[this._tempRoute].event[tempId]
                .option[selectedItem].text,
            widget.hilo.route[this._tempRoute].event[tempId].role,
            _isMe(widget.hilo.route[this._tempRoute].event[tempId].role));
        this.i = widget.hilo.route[this._tempRoute].event[tempId]
            .option[selectedItem].next;
      } else {
        return;
      }
    } else if (widget.hilo.route[this._tempRoute].event[tempId].judgment !=
        null) {
      _saveProgress(this.i);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JudgmentScreen(
                  judgament: widget
                      .hilo.route[this._tempRoute].event[tempId].judgment)));
    } else {
      this.i = widget.hilo.route[this._tempRoute].event[tempId].next;
      _printMensaje(
          widget.hilo.route[this._tempRoute].event[tempId].text,
          widget.hilo.route[this._tempRoute].event[tempId].role,
          _isMe(widget.hilo.route[this._tempRoute].event[tempId].role));
    }
  }

  bool _isMe(String role) {
    if (widget.myRole == role) {
      return true;
    } else {
      return false;
    }
  }

  // bool _cargarCaso() {
  //   var futureHilo = api.getHilo();

  //   futureHilo.then((resp) {
  //     widget.hilo = resp;
  //     this.myRole = resp.route[this._tempRoute].role;
  //   }).catchError((err) {
  //     print("caught $err");
  //   }).whenComplete(() {
  //     visibilityNext ? null : _changed(true);
  //   });

  //   return true;
  // }

  // void _changed(bool visibility) {
  //   setState(() {
  //     this.visibilityNext = visibility;
  //   });
  // }

  // Widget _buildItemPicker(List<Option> option) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).pop(selectedItem);
  //     },
  //     child: CupertinoPicker(
  //       itemExtent: 60.0,
  //       backgroundColor: CupertinoColors.white,
  //       onSelectedItemChanged: (index) {
  //         setState(() => selectedItem = index);
  //         print(selectedItem);
  //       },
  //       children: List<Widget>.generate(option.length, (index) {
  //         return Padding(
  //             padding: EdgeInsets.all(10),
  //             child: Center(
  //               child: Text(option[index].text),
  //             ));
  //       }),
  //     ),
  //   );
  // }

  List<CupertinoActionSheetAction> _po(List<Option> option) {
    List<CupertinoActionSheetAction> actions = <CupertinoActionSheetAction>[];
    for (var i = 0; i < option.length; i++) {
      actions.insert(
          i,
          CupertinoActionSheetAction(
            child: Text(
              option[i].text,
              style: const TextStyle(
                  color: const Color(0xff393e46),
                  fontWeight: FontWeight.w300,
                  fontFamily: "Nunito",
                  fontStyle: FontStyle.normal,
                  fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context).pop(selectedItem);
              selectedItem = i;
            },
          ));
    }
    return actions;
  }

  Widget _buildItem(List<Option> option) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(selectedItem);
      },
      child: CupertinoActionSheet(
        title: Text(
          'Selecciona tu respuesta',
          style: TextStyle(
            color: Color(0xff00adb5),
            fontSize: 18,
          ),
        ),
        actions: _po(option),
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            'Volver a la Audencia',
            style: TextStyle(
              color: Color(0xff393e46),
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              fontSize: 18,
            ),
          ),
          isDefaultAction: true,
          onPressed: () {
            Navigator.of(context).pop(selectedItem);
            setState(() => selectedItem = -1);
          },
        ),
      ),
    );
  }
}

// class ButtonNext extends StatefulWidget {
//   final bool visibilityNext;

//   ButtonNext({Key key, this.visibilityNext}) : super(key: key);

//   @override
//   _ButtonNextState createState() => _ButtonNextState();
// }

// class _ButtonNextState extends State<ButtonNext> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.visibilityNext
//         ? FlatButton(
//             onPressed: () {
//               var bottomSheetController = showBottomSheet(
//                   context: context,
//                   builder: (context) => Container(
//                         color: Colors.grey[900],
//                         height: 250,
//                       ));
//               bottomSheetController.closed.then((value) {});
//             },
//             child: Text("SIGUIENTE"),
//           )
//         : Container();
//   }
// }

// class MyFloatingActionButton extends StatefulWidget {
//   @override
//   _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
// }

// class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
//   bool showFab = true;

//   @override
//   Widget build(BuildContext context) {
//     return showFab
//         ? FloatingActionButton(
//             onPressed: () {
//               var bottomSheetController = showBottomSheet(
//                   context: context,
//                   builder: (context) => Container(
//                         color: Colors.grey[900],
//                         height: 250,
//                       ));

//               showFoatingActionButton(false);

//               bottomSheetController.closed.then((value) {
//                 showFoatingActionButton(true);
//               });
//             },
//           )
//         : Container();
//   }

//   void showFoatingActionButton(bool value) {
//     setState(() {
//       showFab = value;
//     });
//   }
// }
