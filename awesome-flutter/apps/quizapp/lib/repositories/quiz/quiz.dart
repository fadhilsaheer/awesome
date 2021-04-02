import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'base_quiz_repositor.dart';

final dioProvider = Provider<Dio>((ref) => Dio());

class QuizRepository extends BaseQuizRespository {
  final Reader _reader;

  QuizRepository(this._reader);

}
