import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:msg_fireB_try/chatWithMe.dart';
import 'package:hexcolor/hexcolor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController messaingTextBox = TextEditingController();

  final CollectionReference cr =
      FirebaseFirestore.instance.collection('messages');

  @override
  Widget build(BuildContext context) {
    // print(cr.snapshots().first);

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.black12,
        //   title: Text('Science E'),
        //   leading: Padding(
        //     padding: const EdgeInsets.all(5.0),
        // child: Image.asset(
        //   'assets/images/dadaf.png',
        // ),
        //   ),
        //   actions: [
        // Image.asset(
        //   'assets/images/ci.png',
        // ),
        //   ],
        // ),
        backgroundColor: HexColor("#E4EEF2"),

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  // color: HexColor("#66A5A5"),
                  color: HexColor("#AAD2DE"),

                  // color: Colors.amber,

                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyButtonTWo(),
                    // Image.asset(
                    //   'assets/images/dadaf.png',
                    // ),
                    Text(
                      'Science E',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: StreamBuilder(
                stream: cr.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  // if (!snapshot.hasData)
                  //   return Image.asset('assets/images/me (1).png');

                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: HexColor("#AECCF2"),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      snapshot.data.documents[index]
                                          .data()['username'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      // style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  // width: 38.0,
                                  width:
                                      MediaQuery.of(context).size.width / 1.6,
                                  decoration: BoxDecoration(
                                      color: HexColor("#7bacbf"),
                                      borderRadius: BorderRadius.only(
                                        // bottomLeft: Radius.circular(12.0),
                                        topRight: Radius.circular(25.0),
                                        bottomLeft: Radius.circular(25.0),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          snapshot.data.documents[index]
                                              .data()['messagetext'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: HexColor("#003F51"),
                      style: TextStyle(color: Colors.black),
                      controller: messaingTextBox,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FloatingActionButton(
                    backgroundColor: HexColor("#003F51"),
                    onPressed: () {
                      Message m = Message(
                          username: "unkown ",
                          messagetext: messaingTextBox.text.toString());

                      cr.add(m.mapMessages());
                    },
                    child: Icon(Icons.send),
                    // child: Image.asset(
                    //   'assets/images/ci.png',
                    // ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String username;
  final String messagetext;

  Message({this.username, this.messagetext});

  mapMessages() {
    return {'username': username, 'messagetext': messagetext};
  }
}

showaDialog(context) {
  showDialog(
    builder: (context) {
      print('123');
      return AlertDialog(
        title: Text('This is a Alert'),
        actions: [
          RaisedButton(
            onPressed: () {
              print('ok pres');
            },
            child: Text('ok'),
          )
        ],
      );
    },
    context: context,
  );
}
