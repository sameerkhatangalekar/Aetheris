import 'package:aetheris/core/config/dependency_injection.dart';
import 'package:aetheris/core/router/router.dart';
import 'package:aetheris/core/theme/theme.dart';
import 'package:aetheris/features/home/representation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependency();
  Animate.restartOnHotReload=true;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => serviceLocator()
        )
      ],
      child: MaterialApp.router(
        title: 'Aetheris',
        theme: AppTheme.theme,
        routerConfig: AppRouter.router,
      ),
    ),
  );
}
