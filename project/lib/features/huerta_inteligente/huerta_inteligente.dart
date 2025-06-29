import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'application/cubit/huerta_cubit.dart';

// dart run build_runner build --delete-conflicting-outputs
import 'huerta_inteligente.config.dart';
import 'presentation/registro_cultivo_page.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => getIt.init();
Future<Widget> huertaApp() async {
  await configureDependencies();

  return BlocProvider(
    create: (_) => getIt<HuertaCubit>(),
    child: MaterialApp(home: const RegistroCultivoPage()),
  );
}
