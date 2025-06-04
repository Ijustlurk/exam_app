class Exam {
  final String examId;
  final DateTime dateCreated;
  final String teacher;
  final String title;
  final String term;
  final String subject;
  final String semester; 
  final double scores;
  final double noOfItems;
  final DateTime schedule;
  final Duration duration;
  final bool isActive;
  final bool isFinished;
  final bool isApprovedforReview;

  Exam({
    required this.examId,
    required this.dateCreated,
    required this.teacher,
    required this.title,
    required this.term,
    required this.subject,
    required this.semester,
    required this.schedule,
    required this.duration,
    required this.isActive,
    this.scores = 0,
    required this.noOfItems,
    required this.isFinished,
    required this.isApprovedforReview,
  });
}

// Temporary mock data for development
List<Exam> mockExams = [
  Exam(
    examId: '1',
    dateCreated: DateTime(2025, 5, 18),
    teacher: 'Prof. Smith',
    title: 'Algebra Prelim',
    term: 'Prelim',
    subject: 'Algebra',
    semester: 'First Semester',
    schedule: DateTime(2025, 6, 1, 9, 0),
    duration: Duration(hours: 2),
    scores: 2,
    isActive: true,
    isFinished: true,
    noOfItems: 6,
    isApprovedforReview: true,
  ),
    Exam(
    examId: '2',
    dateCreated: DateTime(2025, 5, 18),
    teacher: 'Prof. Smith',
    title: 'Science Prelim',
    term: 'Prelim',
    subject: 'Algebra',
    semester: 'First Semester',
    schedule: DateTime(2025, 7, 1, 9, 0),
    duration: Duration(hours: 2),
    scores: 100,
    isActive: true,
    isFinished: true,
    isApprovedforReview: false,
    noOfItems: 50,
  ),
    Exam(
    examId: '3',
    dateCreated: DateTime(2025, 5, 18),
    teacher: 'Prof. Smith',
    title: 'Chemistry Prelim',
    term: 'Prelim',
    subject: 'Algebra',
    semester: 'First Semester',
    schedule: DateTime(2025, 6, 1, 9, 0),
    duration: Duration(hours: 2),
    scores: 100,
    isActive: true,
    isFinished: true,
    isApprovedforReview: false,
    noOfItems: 50,
  ),
  Exam(
    examId: '4',
    dateCreated: DateTime(2025, 5, 10),
    teacher: 'Prof. Lee',
    title: 'Physics Midterm',
    term: 'Midterm',
    subject: 'Physics',
    semester: 'Second Semester',
    schedule: DateTime(2025, 7, 10, 13, 0),
    duration: Duration(hours: 1, minutes: 30),
    isActive: false,
    isFinished: true,
    scores: 85,
    noOfItems: 100,
    isApprovedforReview: false
  ),
  // Add more mock exams as needed
];
