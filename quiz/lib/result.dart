import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You Did IT!';
    if (resultScore <= 500) {
      resultText = "Good";
    } else if (resultScore <= 1000) {
      resultText = "Very Good!";
    } else if (resultScore > 1000) {
      resultText = "Aswem!";
    } else {
      resultText = "Awful!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart'),
            textColor: Colors.red,
          )
        ],
      ),
    );
  }
}
