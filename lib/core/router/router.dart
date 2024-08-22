

import 'package:aetheris/features/home/domain/entity/weather_entity.dart';
import 'package:aetheris/features/home/representation/pages/forecast_details_page.dart';
import 'package:aetheris/features/home/representation/pages/home_page.dart';
import 'package:aetheris/features/splash/representation/pages/splash_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return  Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: ()=>context.pop(), icon: const Icon(Icons.arrow_back)),
        ),
        body: const Center(child: Text('Page Not Found',style: TextStyle(color: Colors.white),),),
      );
    },
    routes: [

      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const SplashPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return CupertinoPageTransition(
                  primaryRouteAnimation: animation,
                  secondaryRouteAnimation: secondaryAnimation,
                  linearTransition: true,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const HomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return CupertinoPageTransition(
                  primaryRouteAnimation: animation,
                  secondaryRouteAnimation: secondaryAnimation,
                  linearTransition: true,
                  child: child,
                );
              });
        },
        routes: [

          GoRoute(
            path: 'details',
            pageBuilder: (context, state) {
             ForecastDayEntity forecastDayEntity =  state.extra as ForecastDayEntity;
              return CustomTransitionPage(
                  child:  ForecastDetailsPage(forecastDayEntity: forecastDayEntity),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return CupertinoPageTransition(
                      primaryRouteAnimation: animation,
                      secondaryRouteAnimation: secondaryAnimation,
                      linearTransition: true,
                      child: child,
                    );
                  });
            },
          ),
        ]
      ),


    ],
   // redirect: _guard,
  );
  //
  // static String? _guard(BuildContext context, GoRouterState state) {
  //   return '/';
  // }
}