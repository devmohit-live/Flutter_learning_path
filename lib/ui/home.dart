import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';

myapp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.amber.shade300);

  myt() {
    Fluttertoast.showToast(
        msg: "This is Mohit !!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  var mybody = Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    color: Colors.grey.shade200,
    margin: EdgeInsets.all(20),
    child: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.amber.shade700,
              width: 3,
            ),
          ),
          margin: EdgeInsets.all(50),
          // padding: EdgeInsets.all(30),
          // padding: EdgeInsets.only(left: 70),
          alignment: Alignment.center,
          width: 450,
          height: 170,
          // color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Mohit Singh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  Text('  abc@xyz.com'),
                ],
              ),
            ],
          ),
        ),
        // multiple events can be used here with GestureDetector or InkWell, InkWell is old and does'nt offer that much evenets
        GestureDetector(
          onDoubleTap: () => print('Double tap'),
          onTap: () => print('single tap'),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1101017664565047296/HjsAtquu_400x400.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.amber.shade700,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.amber.shade700,
                width: 3,
              ),
            ),
            // margin: EdgeInsets.all(20),
            width: 100,
            height: 100,
            // color: Colors.blue,
            // child: Text('second'),
          ),
        ),
      ],
    ),
  );

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('LW Students'),
        backgroundColor: Colors.amber,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_a_photo), onPressed: myt),
          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => print('Icon pressed'))
        ],
      ),
      body: mybody,
    ),
  );
}
