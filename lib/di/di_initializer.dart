import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:appointment_users/di/di_initializer.config.dart';

@injectableInit
Future<GetIt> initDi(GetIt getIt, String environment) async =>
    getIt.init( environment: environment);
