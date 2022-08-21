import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scripts_task/core/network/network_info.dart';
import 'package:scripts_task/practitioner_screen/cubit/calendar/calendar_cubit.dart';
import 'package:scripts_task/practitioner_screen/data/repos/calendar_repos_impl.dart';
import 'package:scripts_task/practitioner_screen/datasources/local_datasource.dart';
import 'package:scripts_task/practitioner_screen/datasources/remote_datasource.dart';
import 'package:scripts_task/practitioner_screen/domain/repos/calendar_repos.dart';
import 'package:scripts_task/practitioner_screen/domain/usecases/creat_appointment.dart';
import 'package:scripts_task/practitioner_screen/domain/usecases/get_all_practitioners.dart';

final sl = GetIt.instance;
Future<void> initn() async {
  ///usecases
  sl.registerLazySingleton(() => GetAllPractitionersUseCase(repos: sl()));
  sl.registerLazySingleton(() => CreateAppointmentUseCase(repos: sl()));

  ///repos
  sl.registerLazySingleton<CalendarRepos>(() => CalendarReposImpl(
        remoteDataSource: sl(),
        localDataSource: sl(),
        networkInfo: sl(),
      ));

  ///Datasources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  ///core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  
}
