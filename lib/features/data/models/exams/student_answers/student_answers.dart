class StudentAnswers {
  final String examId;
  final String questionId;
  final String studentAnswer;
  final bool isCorrect; // This can be a string or a number depending on the question type

  StudentAnswers({
    required this.examId,
    required this.questionId,
    required this.studentAnswer, //choiceID
    required this.isCorrect,
  });
}

// Temporary mock data for development
List<StudentAnswers> mockQuestions = [
  StudentAnswers(
    examId: '1',
    questionId: '1',
    studentAnswer: '3',
    isCorrect: true,
  ),
  StudentAnswers(
    examId: '1',
    questionId: '2',
    studentAnswer: '3',
    isCorrect: true,
  ),
  StudentAnswers(
    examId: '1',
    questionId: '3',
    studentAnswer: '4',
    isCorrect: false,
  ),
  StudentAnswers(
    examId: '1',
    questionId: '4',
    studentAnswer: '4',
    isCorrect: false,
  ),
    StudentAnswers(
    examId: '1',
    questionId: '5',
    studentAnswer: '1',
    isCorrect: false,
  ),
    StudentAnswers(
    examId: '1',
    questionId: '6',
    studentAnswer:'1',
    isCorrect: false,
  ),
  // Add more mock questions as needed
];
