import 'package:quizapp/models/question_model.dart';
import 'package:quizapp/enums/difficulty.dart';

abstract class BaseQuizRespository {
  Future<List<Question>> getQuestion({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}
