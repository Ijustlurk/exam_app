class Question {
  final String examId;
  final String questionId;
  final String questionText;
  final String questionType; // e.g., 'multiple_choice', 'true_false', 'short_answer', etc.
  final double points; // This can be a string or a number depending on the question type

  Question({
    required this.examId,
    required this.questionId,
    required this.questionText,
    required this.questionType,
    required this.points,
  });
}

// Temporary mock data for development
List<Question> mockQuestions = [
  Question(
    examId: '1',
    questionId: '1',
    questionText: 'What is the value of x in the equation 2x + 3 = 7?',
    questionType: 'multiple_choice',
    points: 1,
  ),
  Question(
    examId: '1',
    questionId: '2',
    questionText: 'Which of the following is a prime number?',
    questionType: 'multiple_choice',
    points: 1,
  ),
  Question(
    examId: '1',
    questionId: '3',
    questionText: 'Water boils at _____°C.',
    questionType: 'multiple_choice',
    points: 1,

  ),
  Question(
    examId: '1',
    questionId: '4',
    questionText: 'What is the chemical symbol for Sodium?',
    questionType: 'multiple_choice',
    points: 1,
  ),
    Question(
    examId: '1',
    questionId: '5',
    questionText: 'What is the chemical symbol for Gold?',
    questionType: 'multiple_choice',
    points: 1,
  ),
  Question(
    examId: '1',
    questionId: '6',
    questionText: 'What is the capital city of France?',
    questionType: 'multiple_choice',
    points: 2,
  ),
  Question(
    examId: '2',
    questionId: '7',
    questionText: 'What is the capital city of France?',
    questionType: 'multiple_choice',
    points: 2,
  ),

  // Add more mock questions as needed
];
