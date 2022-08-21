import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';

class Selection extends Practitioner {
  const Selection({
    required super.id,
    required super.name,
    super.imagePath,
  });
}
