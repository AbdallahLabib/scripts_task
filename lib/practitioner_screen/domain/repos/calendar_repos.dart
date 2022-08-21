import 'package:dartz/dartz.dart';
import 'package:scripts_task/core/failure.dart';
import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';

abstract class CalendarRepos {
  Future<Either<Failure, List<Practitioner>>> getAllPractitioners();

  Future<Either<Failure, Unit>> createAppointment(Practitioner practitioner);
}
