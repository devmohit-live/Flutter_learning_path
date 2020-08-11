## In this branch/day we will be modifying the day10 code :

- Stateful Widgets

```dart

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  var statevariable;
  //state variables has to be declared before build context
  Widget build(BuildContext context) {
    return Container();
  }
}
```

- setState : To change the state variables values

```dart
setState(() {
        webdata = response.body;
      });
```

- ?? Operator : to check whether the variable is null or not if it is a default provided value will be returned in place.

```dart
Text(webdata ?? "Output will be shown here: ")
```
