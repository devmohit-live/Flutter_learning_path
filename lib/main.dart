import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// for playing local and network files
import 'package:audioplayers/audio_cache.dart'; //for playing assets
// import 'ui/btns.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const audiourl =
        'https://github.com/SuhaniArora/Flutter_Mutlimedia_App/blob/master/multimedia_app/audio.mp3?raw=true';
    AudioCache player =
        AudioCache(prefix: 'audios/'); // class to plays assets files
    //now to play audio from internet
    final audioPlayer = AudioPlayer();
    var btn = Card(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.pause),
            onPressed: () {
              var result = audioPlayer.pause();
            },
          ),
          IconButton(
            icon: Icon(Icons.stop),
            onPressed: () {
              var result = audioPlayer.stop();
            },
          ),
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              var result = audioPlayer.resume();
            },
          ),
          IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              // print('jello')
              var result = audioPlayer.seek(Duration(milliseconds: 1200));
            },
          )
        ],
      ),
    );
    FlutterStatusbarcolor.setStatusBarColor(Colors.deepOrange);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () => print("hello"))
            ],
            title: Text("Audio Player"),
          ),
          body: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 8,
                    borderOnForeground: true,
                    child: Row(
                      children: <Widget>[
                        FlatButton.icon(
                            onPressed: () {
                              player.play('Pain.mp3');
                            },
                            icon: Icon(Icons.play_arrow),
                            label: Text('Play Pain Theme'))
                      ],
                    ),
                  ),
                  Card(
                    elevation: 8,
                    borderOnForeground: true,
                    child: Row(
                      children: <Widget>[
                        FlatButton.icon(
                            onPressed: () {
                              audioPlayer.play(audiourl);
                            },
                            icon: Icon(Icons.play_arrow),
                            label: Text('Online Music Play'))
                      ],
                    ),
                  ),
                  btn
                ],
              ),
            ),
          )),
    );
  }
}
