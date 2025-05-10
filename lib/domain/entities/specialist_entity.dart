class SpecialistEntity {
  final String id;
  final String name;
  final String category;
  final List<String> availableDays;
  final List<String> availableTimes;
  final String? bio;
  final DateTime createdAt;


  SpecialistEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.availableDays,
    required this.availableTimes,
    required this.createdAt,

    this.bio,
  });
}
