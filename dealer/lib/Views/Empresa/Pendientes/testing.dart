import 'package:flutter/material.dart';

class testing extends StatefulWidget {
  final List<Map<String, String>> filas;
  const testing({Key key, this.filas}) : super(key: key);
  @override
  _testingState createState() => _testingState();
}

class _testingState extends State<testing> {

  @override
  Widget build(BuildContext context) {
    print("mi widget.filas es : ${widget.filas}");
    return Container(child: Text("${widget.filas.isEmpty}"),);
  }
}
