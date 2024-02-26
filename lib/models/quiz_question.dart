// create a model for the quiz question

class QuizQuestion {
  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // final means you cant reassign the variable
    final ret  = List.of(answers);
    ret.shuffle();
    return ret;
  }
  
  const QuizQuestion(this.question, this.answers);
}