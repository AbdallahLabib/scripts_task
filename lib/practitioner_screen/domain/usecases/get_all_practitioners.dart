import 'package:dartz/dartz.dart';
import 'package:scripts_task/core/failure.dart';
import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';
import 'package:scripts_task/practitioner_screen/domain/repos/calendar_repos.dart';

class GetAllPractitionersUseCase {
  final CalendarRepos repos;

  GetAllPractitionersUseCase({
    required this.repos,
  });

  Future<Either<Failure, List<Practitioner>>> call() async {
    return await repos.getAllPractitioners();
  }
}
