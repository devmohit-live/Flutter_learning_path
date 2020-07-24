import 'package:flutter/material.dart';
import 'ui/home.dart';

main() {
  runApp(MyBuildContext());
}

// for enabling hot reload
class MyBuildContext extends StatelessWidget {
  build(BuildContext context) {
    return myApp();
  }
}
