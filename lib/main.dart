import 'package:flutter/material.dart';
import 'package:quizzler/quizbrain.dart';

void main() => runApp(Quizzler());
quizbrain quiz = quizbrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffd0bcff),
        body: quizpagestate(),
      ),
    );
  }
}

class quizpagestate extends StatefulWidget {
  const quizpagestate({Key? key}) : super(key: key);

  @override
  State<quizpagestate> createState() => _quizpagestateState();
}

class _quizpagestateState extends State<quizpagestate> {
  List<Icon> scorekeeper = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Container(
              color: Colors.green,
              height: 200,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    quiz.questiontext(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () {
                  checkAnswer(true);

                  setState(() {
                    if (quiz.isFinished()) {
                      quiz.reset();
                      scorekeeper.clear();
                    }
                    quiz.nextQuestions();
                  });
                },
                child: const Text(
                  'true',
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(16.0),
              ),
              onPressed: () {
                checkAnswer(false);
                setState(() {
                  if (quiz.isFinished()) {
                    quiz.reset();
                    scorekeeper.clear();
                  }
                  quiz.nextQuestions();
                });
              },
              child: Text("false",
                  style: TextStyle(color: Colors.red, fontSize: 30)),
            ),
          ),
          Row(
            children: scorekeeper,
          )
        ],
      ),
    );
  }

  void checkAnswer(bool useranswer) {
    bool correctanswer = quiz.questionanswer();
    setState(() {
      if (useranswer == correctanswer) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quiz.questionbank;
    });
  }
}
