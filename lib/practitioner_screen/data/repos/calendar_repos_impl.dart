import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:dartz/dartz.dart';
import 'package:scripts_task/core/exception.dart';

import 'package:scripts_task/core/failure.dart';
import 'package:scripts_task/core/network/network_info.dart';
import 'package:scripts_task/practitioner_screen/data/models/view_models/selection_model.dart';
import 'package:scripts_task/practitioner_screen/datasources/local_datasource.dart';
import 'package:scripts_task/practitioner_screen/datasources/remote_datasource.dart';
import 'package:scripts_task/practitioner_screen/domain/entities/practitioner.dart';
import 'package:scripts_task/practitioner_screen/domain/repos/calendar_repos.dart';

class CalendarReposImpl extends CalendarRepos {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CalendarReposImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Unit>> createAppointment(
      Practitioner practitioner) async {
    final Selection selection = Selection(
      id: practitioner.id,
      name: practitioner.name,
      imagePath: practitioner.imagePath,
    );
    if (await networkInfo.isConnected && !kIsWeb) {
      try {
        await remoteDataSource.createAppointment(selection);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Practitioner>>> getAllPractitioners() async {
    if (await networkInfo.isConnected && !kIsWeb) {
      try {
        final remotePractitioners =
            await remoteDataSource.getAllPractitioners();
        localDataSource.cachePractitioners(remotePractitioners);
        return Right(remotePractitioners);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPractitioners =
            await localDataSource.getCachedPractitioners();
        localDataSource.cachePractitioners(localPractitioners);
        return Right(localPractitioners);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
