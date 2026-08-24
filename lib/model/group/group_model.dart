class GroupModel {
  final int id;
  final int educationFKId;
  final String name;
  final String imagePath;
  final String time;
  final String day;
  final String tPMorAM;

  GroupModel({
    required this.id,
    required this.educationFKId,
    required this.name,
    required this.imagePath,
    required this.time,
    required this.day,
    required this.tPMorAM,
  });
}

