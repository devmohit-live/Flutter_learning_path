import 'package:flutter/material.dart';
import 'ui/home.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

/* After adding dependencies run flutter pub get ,restart ide if required
now manually type the class and propertoes of the downloaded packages after importing as 
sometimes the copied data shows error, but when typed works fine/
 */
main() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.tealAccent);
  runApp(MyBuildContext());
}

// for enabling hot reload
class MyBuildContext extends StatelessWidget {
  build(BuildContext context) {
    return myApp();
  }
}
