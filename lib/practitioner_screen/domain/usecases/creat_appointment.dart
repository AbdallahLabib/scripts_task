import 'package:dartz/dartz.dart';
import 'package:scripts_task/core/failure.dart';
import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';
import 'package:scripts_task/practitioner_screen/domain/repos/calendar_repos.dart';

class CreateAppointmentUseCase {
  final CalendarRepos repos;

  CreateAppointmentUseCase({
    required this.repos,
  });

  Future<Either<Failure, Unit>> call(Practitioner practitioner) async {
    return await repos.createAppointment(practitioner);
  }
}
