// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce/di/register_module.dart' as _i8;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i395;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i607;
import 'package:ecommerce/features/auth/data/data_sources/romote/auth_api_remote_data_source.dart'
    as _i678;
import 'package:ecommerce/features/auth/data/data_sources/romote/auth_remote_data_source.dart'
    as _i616;
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart'
    as _i177;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i350;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i395.AuthLocalDataSource>(
      () => _i607.AuthSharedPrefsLocalDataSource(),
    );
    gh.singleton<_i616.AuthRemoteDataSource>(
      () => _i678.AuthApiRemoteDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i177.AuthRepository>(
      () => _i177.AuthRepository(
        gh<_i616.AuthRemoteDataSource>(),
        gh<_i395.AuthLocalDataSource>(),
      ),
    );
    gh.singleton<_i350.AuthCubit>(
      () => _i350.AuthCubit(gh<_i177.AuthRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
