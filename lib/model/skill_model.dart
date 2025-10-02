import 'package:equatable/equatable.dart';

class SkillModel extends Equatable {
  final String name;
  final String level;
  final String image;

  const SkillModel({
    required this.name,
    required this.level,
    required this.image,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'],
      level: json['level'],
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [name, level, image];
}
