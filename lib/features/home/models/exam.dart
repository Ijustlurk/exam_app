class Exam {
  final String examId;
  final DateTime dateCreated;
  final String teacher;
  final String title;
  final String term; // 'prelim', 'midterm', 'final'
  final String subject;
  final String semester; // e.g. 'First Semester', 'Second Semester'
  final DateTime schedule;
  final Duration duration;
  final bool isActive;
  final bool isFinished;

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
    required this.isFinished,
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
    isActive: true,
    isFinished: false,
  ),
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
    isActive: true,
    isFinished: false,
  ),
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
    isActive: true,
    isFinished: false,
  ),
  Exam(
    examId: '1',
    dateCreated: DateTime(2025, 5, 18),
    teacher: 'Guy Smith',
    title: 'Algebra Prelim',
    term: 'Prelim',
    subject: 'Algebra',
    semester: 'First Semester',
    schedule: DateTime(2025, 6, 1, 9, 0),
    duration: Duration(hours: 2),
    isActive: true,
    isFinished: false,
  ),
  Exam(
    examId: '2',
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
  ),
  // Add more mock exams as needed
];
