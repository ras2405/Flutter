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
import 'package:project/features/huerta_inteligente/application/bloc/cultivo_form_bloc.dart'
    as _i25;
import 'package:project/features/huerta_inteligente/application/cubit/huerta_cubit.dart'
    as _i482;
import 'package:project/features/huerta_inteligente/domain/repositories/cultivo_repo.dart'
    as _i218;
import 'package:project/features/huerta_inteligente/domain/services/cultivo_service.dart'
    as _i280;
import 'package:project/features/huerta_inteligente/infraestructure/repositories/cultivo_repo_impl.dart'
    as _i978;
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
    gh.lazySingleton<_i218.CultivoRepository>(
      () => _i978.CultivoRepositoryImpl(),
    );
    gh.lazySingleton<_i646.NotaRepository>(() => _i820.NotaRepositoryImpl());
    gh.factory<_i1032.GestorNotas>(
      () => _i1032.GestorNotas(gh<_i646.NotaRepository>()),
    );
    gh.factory<_i280.CultivoService>(
      () => _i280.CultivoService(gh<_i218.CultivoRepository>()),
    );
    gh.factory<_i533.NotasCubit>(
      () => _i533.NotasCubit(gh<_i1032.GestorNotas>()),
    );
    gh.factory<_i25.CultivoFormBloc>(
      () => _i25.CultivoFormBloc(gh<_i280.CultivoService>()),
    );
    gh.factory<_i482.HuertaCubit>(
      () => _i482.HuertaCubit(gh<_i280.CultivoService>()),
    );
    return this;
  }
}
