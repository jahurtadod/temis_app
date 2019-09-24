import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:temis_app/Hilo/model/hilo.dart';
import 'package:temis_app/Hilo/repository/storageApi.dart';
import 'package:temis_app/Hilo/ui/screens/judgment.dart';
import 'package:temis_app/Hilo/ui/widgets/bubbleChat.dart';

class ChatCaso extends StatefulWidget {
  @override
  _ChatCasoState createState() => _ChatCasoState();
}

class _ChatCasoState extends State<ChatCaso> {
  bool visibilityNext = false;
  Hilo hilo;
  final List<BubbleChat> _message = <BubbleChat>[];
  final StorageApi api = StorageApi();
  int i = 1;
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.4,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.fromLTRB(0, 5, 10, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/250'),
                backgroundColor: Colors.grey[200],
                minRadius: 30,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Selina Kyle',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  'Online Now',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
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
                  FlatButton(
                    onPressed: () {
                      _cargarCaso();
                    },
                    child: Text("CARGAR CASO"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Expanded(
                    child: Container(),
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
                  visibilityNext
                      ? FlatButton(
                          onPressed: () => _selectEvent(),
                          child: Text("SIGUIENTE"),
                        )
                      : Container(),
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

  void _printMensaje(String tempText, bool isMe) {
    BubbleChat message = new BubbleChat(
      message: tempText,
      isMe: isMe,
    );

    setState(() {
      _message.insert(0, message);
    });
  }

  void _selectEvent() async {
    final tempId =
        this.hilo.route[0].event.indexWhere((event) => event.id == this.i);

    if (this.hilo.route[0].event[tempId].option != null) {
      await showModalBottomSheet<int>(
        context: context,
        builder: (BuildContext context) {
          return _buildItem(this.hilo.route[0].event[tempId].option);
        },
      );
      // await showModalBottomSheet<int>(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return _buildItemPicker(this.hilo.route[0].event[tempId].option);
      //   },
      // );
      _printMensaje(this.hilo.route[0].event[tempId].option[selectedItem].text, true);
      this.i = this.hilo.route[0].event[tempId].option[selectedItem].next;
    } else if (this.hilo.route[0].event[tempId].judgment != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JudgmentScreen(
                  judgament: this.hilo.route[0].event[tempId].judgment)));
    } else {
      this.i = this.hilo.route[0].event[tempId].next;
      _printMensaje(this.hilo.route[0].event[tempId].text, false);
    }
  }

  bool _cargarCaso() {
    var futureHilo = api.getHilo();

    futureHilo.then((resp) {
      this.hilo = resp;
    }).catchError((err) {
      print("caught $err");
    }).whenComplete(() {
      visibilityNext ? null : _changed(true);
    });

    return true;
  }

  void _changed(bool visibility) {
    setState(() {
      this.visibilityNext = visibility;
    });
  }

  Widget _buildItemPicker(List<Option> option) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(selectedItem);
      },
      child: CupertinoPicker(
        itemExtent: 60.0,
        backgroundColor: CupertinoColors.white,
        onSelectedItemChanged: (index) {
          setState(() => selectedItem = index);
          print(selectedItem);
        },
        children: List<Widget>.generate(option.length, (index) {
          return Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(option[index].text),
              ));
        }),
      ),
    );
  }

  List<CupertinoActionSheetAction> _po(List<Option> option) {
    List<CupertinoActionSheetAction> actions = <CupertinoActionSheetAction>[];
    for (var i = 0; i < option.length; i++) {
      actions.insert(
          i,
          CupertinoActionSheetAction(
            child: Text(
              option[i].text,
              style: TextStyle(color: Colors.grey),
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
          title: const Text('Selecciona tu respuesta'),
          message: const Text('Your options are'),
          actions: _po(option),
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop(selectedItem);
              setState(() => selectedItem = 5);
            },
          )),
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
