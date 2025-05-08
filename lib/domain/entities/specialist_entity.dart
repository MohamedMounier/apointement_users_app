class SpecialistEntity {
  final String id;
  final String name;
  final String specialization;
  final List<String> availableDays;
  final List<String> availableTimes;
  final String? bio;

  SpecialistEntity({
    required this.id,
    required this.name,
    required this.specialization,
    required this.availableDays,
    required this.availableTimes,
    this.bio,
  });
}
