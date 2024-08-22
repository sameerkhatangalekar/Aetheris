import 'dart:async';
import 'package:aetheris/features/home/representation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enable device location'),
          ),
        );
      }
    }

    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Location permission is necessary to display accurate weather'),
            ),
          );
        }
        return false;
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Location permission is necessary to display accurate weather'),
          ),
        );
      }
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Aetheris',
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
              fontFamily: 'TenorSans',
            ),
      ),
    )
            .animate(
              onComplete: (controller) async {
                await _checkPermission();
                if (context.mounted) {
                  context.read<HomeBloc>().add(
                        const CurrentWeatherRequestedEvent(),
                      );
                  context.go('/home');
                }
              },
            )
            .fadeIn(
                duration: const Duration(milliseconds: 2000),
                begin: 0.0,
                curve: Curves.easeIn)
            .then()
            .shimmer(
                curve: Curves.easeInOut,
                duration: const Duration(seconds: 1),
                color: Colors.black)
            .then(delay: const Duration(seconds: 1)));
  }
}
