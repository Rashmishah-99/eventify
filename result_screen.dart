import 'dart:developer';

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen(this.result, {Key? key}) : super(key: key);
  double result = 0;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String message = '';

  String suggestion = '';
  int code = 0xff000000;
  @override
  void initState() {
    log(widget.result.toStringAsFixed(2));
    // TODO: implement initState
    // super.initState();
    calc();
  }

  void calc() {
    if (widget.result < 16.0) {
      message = "Severe Thickness";
      code = 0xffd32f2e;
    } else if (widget.result < 17) {
      message = "Moderate Thickness";
      code = 0xfff57c00;  
    } else if (widget.result < 18.5) {
      message = "Mild Thickness";
    } else if (widget.result < 25) {
      message = "Noramal";
    } else if (widget.result < 30) {
      message = "Overweight";
    } else if (widget.result < 35) {
      message = "Obsese class I";
    } else if (widget.result < 40) {
      message = "Obsese class II";
    } else if (widget.result > 40) {
      message = "Obsese class III";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    calc();
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calc')),
      body: Column(
        children: [
          Text(
            widget.result.toStringAsFixed(2),
            style: TextStyle(fontSize: 30),
          ),
          Text(message, style: TextStyle(color: Color(code))),
          Text(suggestion),
        ],
      ),
    );
  }
}
