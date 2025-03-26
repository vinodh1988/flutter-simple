import 'package:flutter/material.dart';
import 'pages/firstpage.dart';
import 'pages/secondpage.dart';
import 'pages/thirdpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()),
              );
            },
            child: Text('Go to First Page'),
          ),
           TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Text('Go to Second Page'),
          ),
           ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdPage()),
              );
            },
            icon: Icon(Icons.navigate_next),
            label: Text('Go to Third Page'),
          )
        ]
      )
   );
  }
}