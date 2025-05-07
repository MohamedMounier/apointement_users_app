// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appointment_users/di/global_key_module.dart' as _i784;
import 'package:appointment_users/router/app_router_helper.dart' as _i872;
import 'package:appointment_users/router/screen_router_helper.dart' as _i97;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final globalKeyModule = _$GlobalKeyModule();
    gh.lazySingleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => globalKeyModule.key,
    );
    gh.singleton<_i872.AppRouterHelper>(
      () => _i872.AppRouterHelper(gh<_i409.GlobalKey<_i409.NavigatorState>>()),
    );
    gh.singleton<_i97.ScreenRouterHelper>(
      () => _i97.ScreenRouterHelper(gh<_i872.AppRouterHelper>()),
    );
    return this;
  }
}

class _$GlobalKeyModule extends _i784.GlobalKeyModule {}
