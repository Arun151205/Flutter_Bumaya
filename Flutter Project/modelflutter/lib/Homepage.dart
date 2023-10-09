import 'package:flutter/material.dart';
import 'package:modelflutter/screen_dua.dart';
import 'package:modelflutter/screen_satu.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenSatu()));
              },
              child: Text('Tombol Pertama'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScreenDua()));
              },
              child: Text('Tombol Kedua'),
            ),
          ],
        ),
      ),
    );
  }
}
