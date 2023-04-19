import 'questions.dart';

class quizbrain {
  int number = 0;
  List<Questions> questionbank = [
    Questions(q: 'you can change your fate by yourself ,no one will', s: false),
    Questions(q: 'respect your time always', s: true),
    Questions(q: 'stay strong and positive', s: true)
  ];

  void nextQuestions() {
    if (number < questionbank.length - 1) {
      number++;
    }
  }

  String questiontext() {
    print(number);
    return questionbank[number].questiontext;
  }

  bool questionanswer() {
    return questionbank[number].questionanswer;
  }

  bool isFinished() {
    if (number >= questionbank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    number = 0;
  }
}
