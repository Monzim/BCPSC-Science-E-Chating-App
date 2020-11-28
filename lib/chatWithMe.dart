import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showaDialog(context);
      },
      child: Image.asset(
        'assets/images/ci.png',
      ),
    );
  }
}

showaDialog(context) {
  showDialog(
    builder: (context) {
      print('123');
      return AlertDialog(
        backgroundColor: HexColor("#AAD2DE"),
        title: Column(
          children: [
            Row(children: [
              Text('This is a Anonymous messaging App',
                  style: TextStyle(fontSize: 12))
            ]),
            Row(children: [
              Text('No one will know who is sending messages.',
                  style: TextStyle(fontSize: 12))
            ]),
            Row(children: [Text('Thank you for using this app.')]),
            Row(
              children: [Text('24/7 Service')],
            ),
          ],
        ),
        actions: [],
      );
    },
    context: context,
  );
}

class MyButtonTWo extends StatelessWidget {
  const MyButtonTWo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showaDialogTo(context);
      },
      child: Image.asset(
        'assets/images/dadaf.png',
      ),
    );
  }
}

showaDialogTo(context) {
  showDialog(
    builder: (context) {
      print('123');
      return AlertDialog(
        backgroundColor: Colors.white10,
        title: Column(
          children: [
            // Row(children: [
            //   Text('This is a Anonymous messaging App',
            //       style: TextStyle(fontSize: 12))
            // ]),
            // Row(children: [
            //   Text('No one will know who is sending messages',
            //       style: TextStyle(fontSize: 12))
            // ]),
            Image.asset(
              'assets/images/dadaf.png',
            ),
          ],
        ),
        actions: [],
      );
    },
    context: context,
  );
}
