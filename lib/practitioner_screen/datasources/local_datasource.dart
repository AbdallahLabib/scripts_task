import 'package:dartz/dartz.dart';
import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';

abstract class LocalDataSource {
  Future<List<Practitioner>> getCachedPractitioners();
  Future<Unit> cachePractitioners(List<Practitioner> practitioner);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<Unit> cachePractitioners(List<Practitioner> practitioner) {
    throw UnimplementedError();
  }

  @override
  Future<List<Practitioner>> getCachedPractitioners() {
    throw UnimplementedError();
  }
}
