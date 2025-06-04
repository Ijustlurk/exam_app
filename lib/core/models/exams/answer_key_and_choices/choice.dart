class Choice {
  final String choiceId;
  final String examId;
  final String questionId;
  final String choiceText;
  final bool correctAnswer;

  Choice({
    required this.choiceId,
    required this.examId,
    required this.questionId,
    required this.choiceText,
    required this.correctAnswer,
  });
}

// Temporary mock data for development
List<Choice> mockChoices = [
  // For exam 1, question 1
  Choice(
    choiceId: '1',
    examId: '1',
    questionId: '1',
    choiceText: '4',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '2',
    examId: '1',
    questionId: '1',
    choiceText: '3',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '3',
    examId: '1',
    questionId: '1',
    choiceText: '2',
    correctAnswer: true,
  ),
  Choice(
    choiceId: '4',
    examId: '1',
    questionId: '1',
    choiceText: '5',
    correctAnswer: false,
  ),
    Choice(
    choiceId: '1',
    examId: '1',
    questionId: '2',
    choiceText: '9',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '2',
    examId: '1',
    questionId: '2',
    choiceText: '6',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '3',
    examId: '1',
    questionId: '2',
    choiceText: '2',
    correctAnswer: true,
  ),
  Choice(
    choiceId: '4',
    examId: '1',
    questionId: '2',
    choiceText: '8',
    correctAnswer: false,
  ),
    Choice(
    choiceId: '1',
    examId: '1',
    questionId: '3',
    choiceText: '50',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '2',
    examId: '1',
    questionId: '3',
    choiceText: '80',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '3',
    examId: '1',
    questionId: '3',
    choiceText: '100',
    correctAnswer: true,
  ),
  Choice(
    choiceId: '4',
    examId: '1',
    questionId: '3',
    choiceText: '59',
    correctAnswer: false,
  ),
    Choice(
    choiceId: '1',
    examId: '1',
    questionId: '4',
    choiceText: 'Cl',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '2',
    examId: '1',
    questionId: '4',
    choiceText: 'Ag',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '3',
    examId: '1',
    questionId: '4',
    choiceText: 'Na',
    correctAnswer: true,
  ),
  Choice(
    choiceId: '4',
    examId: '1',
    questionId: '4',
    choiceText: 'Br',
    correctAnswer: false,
  ),
    Choice(
    choiceId: '1',
    examId: '1',
    questionId: '5',
    choiceText: 'Ag',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '2',
    examId: '1',
    questionId: '5',
    choiceText: 'Tn',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '3',
    examId: '1',
    questionId: '5',
    choiceText: 'Au',
    correctAnswer: true,
  ),
  Choice(
    choiceId: '4',
    examId: '1',
    questionId: '5',
    choiceText: 'Hg',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '1',
    examId: '1',
    questionId: '6',
    choiceText: 'Berlin',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '2',
    examId: '1',
    questionId: '6',
    choiceText: 'Madrid',
    correctAnswer: false,
  ),
  Choice(
    choiceId: '3',
    examId: '1',
    questionId: '6',
    choiceText: 'Paris',
    correctAnswer: true,
  ),
  Choice(
    choiceId: '4',
    examId: '1',
    questionId: '6',
    choiceText: 'Rome',
    correctAnswer: false,
  ),
  // Add more mock choices as needed
];
