import 'models/task_model.dart';
import 'models/study_session_model.dart';

/// ============================================================================
/// SAMPLE / MOCK DATA REPOSITORY
/// ============================================================================
/// NOTE: This data is strictly used for the initial UI presentation and
/// prototypes. In subsequent milestones, this will be connected to a real local
/// database (e.g. SQLite/Hive/Isar) or remote API service.
/// ============================================================================
class SampleData {
  SampleData._();

  /// Mock User Profile
  static const String userName = 'Alex Rivera';
  static const String userMajor = 'Computer Science & Engineering';
  static const int currentStreakDays = 6;
  static const double targetDailyHours = 5.0;
  static const double completedDailyHours = 3.5;

  /// Mock Initial Tasks for College Students
  static List<TaskModel> getInitialTasks() {
    final now = DateTime.now();
    return [
      TaskModel(
        id: 'task-1',
        title: 'Implement Dijkstra’s Algorithm in Graph module',
        course: 'Data Structures & Algorithms',
        priority: TaskPriority.high,
        dueDate: now.add(const Duration(hours: 3)),
        estimatedMinutes: 60,
        isCompleted: true,
      ),
      TaskModel(
        id: 'task-2',
        title: 'Review Chapter 4: Memory Management & Paging',
        course: 'Operating Systems',
        priority: TaskPriority.high,
        dueDate: now.add(const Duration(hours: 5)),
        estimatedMinutes: 45,
        isCompleted: true,
      ),
      TaskModel(
        id: 'task-3',
        title: 'Complete Problem Set 3: Propositional Logic',
        course: 'Discrete Mathematics',
        priority: TaskPriority.medium,
        dueDate: now.add(const Duration(hours: 8)),
        estimatedMinutes: 50,
        isCompleted: false,
      ),
      TaskModel(
        id: 'task-4',
        title: 'Draft Mobile App Architecture Diagram for FocusFlow',
        course: 'Software Engineering',
        priority: TaskPriority.medium,
        dueDate: now.add(const Duration(days: 1)),
        estimatedMinutes: 40,
        isCompleted: false,
      ),
      TaskModel(
        id: 'task-5',
        title: 'Lab Exercise: Normalization (3NF & BCNF)',
        course: 'Database Management Systems',
        priority: TaskPriority.low,
        dueDate: now.add(const Duration(days: 2)),
        estimatedMinutes: 30,
        isCompleted: false,
      ),
    ];
  }

  /// Mock Weekly Study Hours for Statistics Chart (Monday - Sunday)
  static List<double> getWeeklyStudyHours() {
    return [3.8, 4.5, 5.2, 4.0, 3.5, 6.0, 2.5]; // Mon to Sun
  }

  static List<String> getWeeklyDayLabels() {
    return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  }

  /// Mock Subject Distribution for Statistics
  static List<Map<String, dynamic>> getSubjectDistribution() {
    return [
      {'name': 'Data Structures', 'hours': 8.5, 'color': 0xFF8B5CF6},
      {'name': 'Operating Systems', 'hours': 6.2, 'color': 0xFF38BDF8},
      {'name': 'Discrete Math', 'hours': 4.8, 'color': 0xFFF59E0B},
      {'name': 'Software Eng', 'hours': 4.0, 'color': 0xFF10B981},
    ];
  }

  /// Recent Focus Sessions Log
  static List<StudySessionModel> getRecentSessions() {
    final now = DateTime.now();
    return [
      StudySessionModel(
        id: 'sess-1',
        subject: 'Data Structures & Algorithms',
        durationMinutes: 50,
        timestamp: now.subtract(const Duration(hours: 2)),
        notes: 'Binary search tree rebalancing notes completed',
      ),
      StudySessionModel(
        id: 'sess-2',
        subject: 'Operating Systems',
        durationMinutes: 45,
        timestamp: now.subtract(const Duration(hours: 4)),
        notes: 'Page replacement algorithms (FIFO vs LRU)',
      ),
      StudySessionModel(
        id: 'sess-3',
        subject: 'Discrete Mathematics',
        durationMinutes: 25,
        timestamp: now.subtract(const Duration(days: 1, hours: 2)),
        notes: 'Truth tables verification',
      ),
    ];
  }
}
