import 'package:flutter/material.dart';
import 'package:temis_app/Hilo/model/hilo.dart';
import 'package:temis_app/Hilo/repository/storageApi.dart';
import 'package:temis_app/Hilo/ui/widgets/bubbleChat.dart';

class ChatCaso extends StatefulWidget {
  @override
  _ChatCasoState createState() => _ChatCasoState();
}

class _ChatCasoState extends State<ChatCaso> {
  final List<BubbleChat> _message = <BubbleChat>[];
  final StorageApi api = StorageApi(); 
  final List<String> _dialogos = ["Hola", "Como estas", "Holiiiii"];
  int i = 0;

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
            FutureBuilder(
              future: api.getHilo(),
              builder: (BuildContext context, AsyncSnapshot<List<Hilo>> snapshot){
                 if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                   return ListView.builder(
                     itemCount: snapshot.data.length,
                     itemBuilder: (BuildContext context, int index) {
                       return Card(
                         child: ListTile(
                           title: Text(snapshot.data[index].descripcion),
                         ),
                       );
                     }
                   );
                 }
              },
            ),
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera,
                      color: Color(0xff3E8DF3),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image,
                      color: Color(0xff3E8DF3),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Enter Message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _siguienteMensaje(),
                    icon: Icon(
                      Icons.send,
                      color: Color(0xff3E8DF3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _siguienteMensaje() {
    
    String text = _dialogos[this.i];
    print(text);
    BubbleChat message = new BubbleChat(
      message: text,
      isMe: true,
    );
    this.i = this.i + 1;
    setState(() {
      _message.insert(0, message);
    });
  }
}
