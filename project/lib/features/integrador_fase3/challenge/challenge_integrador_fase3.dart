import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:project/features/integrador_fase3/challenge/application/cubit/notas_cubit.dart';
import 'package:project/features/integrador_fase3/challenge/presentation/pages/notas_page.dart';

// dart run build_runner build --delete-conflicting-outputs
import 'challenge_integrador_fase3.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => getIt.init();
Future<Widget> notasApp() async {
  await configureDependencies();

  return BlocProvider(
    create: (_) => getIt<NotasCubit>(),
    child: MaterialApp(home: NotasPage()),
  );
}
