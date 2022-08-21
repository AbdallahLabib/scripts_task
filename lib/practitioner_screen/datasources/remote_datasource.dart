import 'package:dartz/dartz.dart';
import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';

abstract class RemoteDataSource {
  Future<List<Practitioner>> getAllPractitioners();
  Future<Unit> createAppointment(Practitioner practitioner);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<Unit> createAppointment(Practitioner practitioner) {
    throw UnimplementedError();
  }

  @override
  Future<List<Practitioner>> getAllPractitioners() {
    throw UnimplementedError();
  }

}