class StudySessionModel {
  final String id;
  final String subject;
  final int durationMinutes;
  final DateTime timestamp;
  final String notes;

  const StudySessionModel({
    required this.id,
    required this.subject,
    required this.durationMinutes,
    required this.timestamp,
    this.notes = '',
  });
}
