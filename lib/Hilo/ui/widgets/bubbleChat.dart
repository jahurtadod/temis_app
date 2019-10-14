import 'package:flutter/material.dart';

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String message;
  final String role;
  final String myRole;

  BubbleChat({this.message, this.isMe, this.role, this.myRole});

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      padding: isMe ? EdgeInsets.only(left: 40) : EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 12, right: 10),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                decoration: BoxDecoration(
                  color: _selectColor(this.role),
                  // gradient: isMe
                  //     ? LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         stops: [
                  //             0.1,
                  //             1
                  //           ],
                  //         colors: [
                  //             Color(0xFFF6D365),
                  //             Color(0xFFFDA085),
                  //           ])
                  //     : LinearGradient(
                  //         begin: Alignment.topRight,
                  //         end: Alignment.bottomLeft,
                  //         stops: [
                  //             0.1,
                  //             1
                  //           ],
                  //         colors: [
                  //             Color(0xFFEBF5FC),
                  //             Color(0xFFEBF5FC),
                  //           ]),
                  borderRadius: isMe
                      ? BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        )
                      : BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                ),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      // direction: Axis.horizontal,
                      children: <Widget>[
                        isMe
                            ? Container()
                            : Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                                  child: _avatar(this.role),
                                ),
                              ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            child: Text(
                              message,
                              textAlign: isMe ? TextAlign.end : TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // Text(
                        //   message,
                        //   overflow: TextOverflow.clip,
                        //   textAlign: isMe ? TextAlign.end : TextAlign.start,
                        //   style: TextStyle(
                        //     color: isMe ? Colors.white : Colors.grey,
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Container(
          //   padding: EdgeInsets.all(15),
          //   decoration: BoxDecoration(
          //     gradient: isMe
          //         ? LinearGradient(
          //             begin: Alignment.topRight,
          //             end: Alignment.bottomLeft,
          //             stops: [
          //                 0.1,
          //                 1
          //               ],
          //             colors: [
          //                 Color(0xFFF6D365),
          //                 Color(0xFFFDA085),
          //               ])
          //         : LinearGradient(
          //             begin: Alignment.topRight,
          //             end: Alignment.bottomLeft,
          //             stops: [
          //                 0.1,
          //                 1
          //               ],
          //             colors: [
          //                 Color(0xFFEBF5FC),
          //                 Color(0xFFEBF5FC),
          //               ]),
          //     borderRadius: isMe
          //         ? BorderRadius.only(
          //             topRight: Radius.circular(15),
          //             topLeft: Radius.circular(15),
          //             bottomRight: Radius.circular(0),
          //             bottomLeft: Radius.circular(15),
          //           )
          //         : BorderRadius.only(
          //             topRight: Radius.circular(15),
          //             topLeft: Radius.circular(15),
          //             bottomRight: Radius.circular(15),
          //             bottomLeft: Radius.circular(0),
          //           ),
          //   ),
          //   child: Column(
          //     crossAxisAlignment:
          //         isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          //     children: <Widget>[
          //       Text(
          //         message,
          //         textAlign: isMe ? TextAlign.end : TextAlign.start,
          //         style: TextStyle(
          //           color: isMe ? Colors.white : Colors.grey,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _avatar(String role) {
    return Container(
      width: 60,
      height: 70,
      child: Column(
        children: <Widget>[
          Flexible(
              flex: 4,
              child: Container(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(_selectAvatar(role)),
                  backgroundColor: Colors.grey[200],
                  minRadius: 25,
                ),
              )),
          Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  role,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }

  String _selectAvatar(String role) {
    String _avatar;

    switch (role.toLowerCase()) {
      case "fiscalía":
        _avatar = "https://i.pravatar.cc/150?img=59";
        break;
      case "juez":
        _avatar = "https://i.pravatar.cc/150?img=26";
        break;
      case "secretaria":
        _avatar = "https://i.pravatar.cc/150?img=32";
        break;
      case "defensa":
        _avatar = "https://i.pravatar.cc/150?img=61";
        break;
    }
    return _avatar;
  }

  Color _selectColor(String role) {
    var color;

    switch (role.toLowerCase()) {
      case "fiscalía":
        color = Color(0xFFf0d78c);
        break;
      case "juez":
        color = Color(0xFF4f81c7);
        break;
      case "secretaria":
        color = Color(0xFFC7C7C7);
        break;
      case "defensa":
        color = Color(0xFF64c4ed);
        break;
      // case "fiscalía":
      //   color = Color(0xFF4AA0E8);
      //   break;
      // case "juez":
      //   color = Color(0xFF00adb5);
      //   break;
      // case "secretaria":
      //   color = Color(0xFFC7C7C7);
      //   break;
      // case "defensa":
      //   color = Color(0xFFffba10);
      //   break;
    }

    return color;
  }

  // LinearGradient _gradient(String role) {
  //   var firstColor;
  //   var secondColor;

  //   role.toLowerCase();

  //   switch (role.toLowerCase()) {
  //     case "fiscalía":
  //       firstColor = Color(0xFFF6D365);
  //       secondColor = Color(0xFFFDA085);
  //       break;
  //     case "juez":
  //       firstColor = Color(0xFF00adb5);
  //       secondColor = Color(0xFF00adb5);
  //       break;
  //     case "secretaria":
  //       firstColor = Color(0xFF74EBD5);
  //       secondColor = Color(0xFF9FACE6);
  //       break;
  //     case "defensa":
  //       firstColor = Color(0xFFEBF5FC);
  //       secondColor = Color(0xFFEBF5FC);
  //       break;
  //   }

  //   return LinearGradient(
  //       begin: Alignment.topRight,
  //       end: Alignment.bottomLeft,
  //       stops: [
  //         0.7,
  //         1
  //       ],
  //       colors: [
  //         firstColor,
  //         secondColor,
  //       ]);
  // }
}
