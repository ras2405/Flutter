// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:project/features/integrador_fase3/challenge/application/cubit/notas_cubit.dart'
    as _i533;
import 'package:project/features/integrador_fase3/challenge/domain/repositories/nota_repo.dart'
    as _i646;
import 'package:project/features/integrador_fase3/challenge/domain/services/gestor_notas.dart'
    as _i1032;
import 'package:project/features/integrador_fase3/challenge/infraestructure/respository/nota_repo_impl.dart'
    as _i820;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i646.NotaRepository>(() => _i820.NotaRepositoryImpl());
    gh.factory<_i1032.GestorNotas>(
      () => _i1032.GestorNotas(gh<_i646.NotaRepository>()),
    );
    gh.factory<_i533.NotasCubit>(
      () => _i533.NotasCubit(gh<_i1032.GestorNotas>()),
    );
    return this;
  }
}
