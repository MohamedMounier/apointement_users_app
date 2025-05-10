// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appointment_users/core/services/app_prefrences.dart' as _i86;
import 'package:appointment_users/data/data_source/local/user_local_data_source.dart'
    as _i45;
import 'package:appointment_users/data/data_source/remote/auth_data_source.dart'
    as _i1061;
import 'package:appointment_users/data/data_source/remote/specialists_data_source.dart'
    as _i1051;
import 'package:appointment_users/data/repository/auth/auth_repo_impl.dart'
    as _i357;
import 'package:appointment_users/data/repository/auth/user_local_repo_impl.dart'
    as _i232;
import 'package:appointment_users/data/repository/specialists/specialists_repo_impl.dart'
    as _i480;
import 'package:appointment_users/di/firebase_module.dart' as _i123;
import 'package:appointment_users/di/global_key_module.dart' as _i784;
import 'package:appointment_users/di/secure_storage_module.dart' as _i404;
import 'package:appointment_users/domain/repository/auth/auth_repo.dart'
    as _i806;
import 'package:appointment_users/domain/repository/auth/user_local_repo.dart'
    as _i14;
import 'package:appointment_users/domain/repository/specialists/specialists_repo.dart'
    as _i529;
import 'package:appointment_users/domain/use_cases/auth/delete_user_id_usecase.dart'
    as _i711;
import 'package:appointment_users/domain/use_cases/auth/fetch_user_by_uid_usecase.dart'
    as _i366;
import 'package:appointment_users/domain/use_cases/auth/get_user_id_use_case.dart'
    as _i462;
import 'package:appointment_users/domain/use_cases/auth/save_user_id_usecase.dart'
    as _i573;
import 'package:appointment_users/domain/use_cases/auth/sign_in_usecase.dart'
    as _i159;
import 'package:appointment_users/domain/use_cases/auth/sign_out_usecase.dart'
    as _i105;
import 'package:appointment_users/domain/use_cases/auth/sign_up_usecase.dart'
    as _i923;
import 'package:appointment_users/domain/use_cases/specialists/get_specialists_by_category_usecase.dart'
    as _i111;
import 'package:appointment_users/domain/use_cases/specialists/get_specializations_categories_usecase.dart'
    as _i707;
import 'package:appointment_users/presentation/blocs/auth/auth_cubit.dart'
    as _i910;
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart'
    as _i131;
import 'package:appointment_users/router/app_router.dart' as _i872;
import 'package:appointment_users/router/app_router_helper.dart' as _i986;
import 'package:appointment_users/router/screen_router_helper.dart' as _i97;
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter/material.dart' as _i409;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final secureStorageModule = _$SecureStorageModule();
    final firebaseModule = _$FirebaseModule();
    final globalKeyModule = _$GlobalKeyModule();
    gh.factory<_i558.FlutterSecureStorage>(() => secureStorageModule.prefs);
    gh.singleton<_i872.AppRouter>(() => const _i872.AppRouter());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.fireStore);
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => globalKeyModule.key,
    );
    gh.lazySingleton<_i86.AppPreferences>(
      () => _i86.AppPreferences(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i1061.AuthDataSource>(
      () => _i1061.FirebaseAuthDataSource(),
    );
    gh.singleton<_i986.AppRouterHelper>(
      () => _i986.AppRouterHelper(gh<_i409.GlobalKey<_i409.NavigatorState>>()),
    );
    gh.lazySingleton<_i1051.SpecialistsDataSource>(
      () => _i1051.SpecialistsDataSourceImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.lazySingleton<_i529.SpecialistsRepository>(
      () => _i480.SpecialistsRepositoryImpl(gh<_i1051.SpecialistsDataSource>()),
    );
    gh.lazySingleton<_i806.AuthRepository>(
      () => _i357.AuthRepositoryImpl(gh<_i1061.AuthDataSource>()),
    );
    gh.lazySingleton<_i45.UserLocalDataSource>(
      () => _i45.UserLocalDataSource(gh<_i86.AppPreferences>()),
    );
    gh.lazySingleton<_i111.GetSpecialistsByCategoryUseCase>(
      () => _i111.GetSpecialistsByCategoryUseCase(
        gh<_i529.SpecialistsRepository>(),
      ),
    );
    gh.lazySingleton<_i707.GetSpecializationCategoriesUseCase>(
      () => _i707.GetSpecializationCategoriesUseCase(
        gh<_i529.SpecialistsRepository>(),
      ),
    );
    gh.singleton<_i97.ScreenRouterHelper>(
      () => _i97.ScreenRouterHelper(gh<_i986.AppRouterHelper>()),
    );
    gh.lazySingleton<_i14.UserLocalRepository>(
      () => _i232.UserLocalRepositoryImpl(gh<_i45.UserLocalDataSource>()),
    );
    gh.lazySingleton<_i159.SignInUseCase>(
      () => _i159.SignInUseCase(gh<_i806.AuthRepository>()),
    );
    gh.lazySingleton<_i366.FetchUserByIdCase>(
      () => _i366.FetchUserByIdCase(gh<_i806.AuthRepository>()),
    );
    gh.lazySingleton<_i923.SignUpUseCase>(
      () => _i923.SignUpUseCase(gh<_i806.AuthRepository>()),
    );
    gh.factory<_i910.AuthCubit>(
      () =>
          _i910.AuthCubit(gh<_i159.SignInUseCase>(), gh<_i923.SignUpUseCase>()),
    );
    gh.lazySingleton<_i711.DeleteUserIdUseCase>(
      () => _i711.DeleteUserIdUseCase(gh<_i14.UserLocalRepository>()),
    );
    gh.lazySingleton<_i462.GetUserIdUseCase>(
      () => _i462.GetUserIdUseCase(gh<_i14.UserLocalRepository>()),
    );
    gh.lazySingleton<_i573.SaveUserIdUseCase>(
      () => _i573.SaveUserIdUseCase(gh<_i14.UserLocalRepository>()),
    );
    gh.lazySingleton<_i105.SignOutUseCase>(
      () => _i105.SignOutUseCase(
        gh<_i806.AuthRepository>(),
        gh<_i14.UserLocalRepository>(),
      ),
    );
    gh.factory<_i131.HomeCubit>(
      () => _i131.HomeCubit(
        gh<_i105.SignOutUseCase>(),
        gh<_i366.FetchUserByIdCase>(),
        gh<_i462.GetUserIdUseCase>(),
        gh<_i573.SaveUserIdUseCase>(),
        gh<_i111.GetSpecialistsByCategoryUseCase>(),
        gh<_i707.GetSpecializationCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$SecureStorageModule extends _i404.SecureStorageModule {}

class _$FirebaseModule extends _i123.FirebaseModule {}

class _$GlobalKeyModule extends _i784.GlobalKeyModule {}
