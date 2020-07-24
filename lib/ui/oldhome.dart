import 'dart:ui';

import 'package:flutter/material.dart';

MaterialApp myapp() {
  var myimage = Image.network(
    'https://raw.githubusercontent.com/devmohit-live/Images_of_repo/master/portfolio_logos/aws_logo_smile_1200x630.png',
  );

  var mytext = Text(
    "Hello this is a Text",
    style: TextStyle(
        color: Colors.white38, fontSize: 30, fontWeight: FontWeight.bold),
    textDirection: TextDirection.ltr,
  );
  /* these are just icons , they can't be used to perform certain actions we have to use this icons with something*/
  Icon MyEmail = Icon(
    Icons.mail,
    color: Colors.white70,
  );
  Icon MyCal = Icon(
    Icons.calendar_today,
    color: Colors.white70,
  );

  mymail() {
    print("Clicked Email button");
  }

  mycal() {
    print("Clicked Calendar button");
  }

  /*Buttons have onPressed and other events so the icons can be used here they are called IconButton*/
  IconButton MyEmailButton = IconButton(icon: MyEmail, onPressed: mymail);
  IconButton MyCalButton = IconButton(icon: MyCal, onPressed: mycal);
  var myappbar = AppBar(
    title: mytext,
    backgroundColor: Colors.amber,
    leading: myimage,
    actions: <Widget>[
      MyEmailButton,
      MyCalButton,
    ],
  );

  var scf = Scaffold(
    appBar: myappbar,
    body: Container(
      child: Center(child: myimage),
      // color: Colors.black54,
      decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
              image: NetworkImage(
                'https://raw.githubusercontent.com/devmohit-live/Images_of_repo/master/portfolio_logos/aws_logo_smile_1200x630.png',
              ),
              fit: BoxFit.cover),
          // gradient: Gradient.radial(0, 2, [Colors.purple,Colors.blue]),
          border: Border.all(width: 8, color: Colors.white),
          borderRadius: BorderRadius.circular(20.0)),
    ),
    backgroundColor: Colors.grey.shade400,
  );
  var design = MaterialApp(
    home: scf,
    debugShowCheckedModeBanner: false,
  );

  return design;
}
