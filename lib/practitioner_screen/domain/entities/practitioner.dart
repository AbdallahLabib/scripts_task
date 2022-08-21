import 'package:equatable/equatable.dart';

class Practitioner extends Equatable {
  final int id;
  final String name;
  final String imagePath;

  const Practitioner({
    required this.id,
    required this.name,
    this.imagePath = "",
  });

  @override
  List<Object?> get props => [id, name, imagePath];
}
