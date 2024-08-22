import 'package:aetheris/core/theme/theme.dart';
import 'package:flutter/material.dart';

class TemperatureRowWidget extends StatelessWidget {
  final double? maxTemp;
  final double? minTemp;

  const TemperatureRowWidget({
    super.key,
    this.maxTemp,
    this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/maximum_temperature.png',
                height: 50,
                width: 50,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(
                width: 8,
              ),
              RichText(
                text: TextSpan(
                  text: 'Temp max\n',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Palette.subTitleColor),
                  children: [
                    TextSpan(
                      text: '${maxTemp?.round().toString()}°C',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/minimum_temperature.png',
                height: 50,
                width: 50,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(
                width: 8,
              ),
              RichText(
                text: TextSpan(
                  text: 'Temp min\n',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Palette.subTitleColor),
                  children: [
                    TextSpan(
                      text: '${minTemp?.round().toString()}°C',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
