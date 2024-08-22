
import 'package:aetheris/core/theme/theme.dart';
import 'package:flutter/material.dart';

class SolarLunarDataRowWidget extends StatelessWidget {
  final String? sunrise;
  final String? sunset;

  const SolarLunarDataRowWidget({
    super.key,
    this.sunrise,
    this.sunset,
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
                  'assets/icons/800.png',
                  height: 48,
                  width: 48,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 8,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Sunrise\n',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Palette.subTitleColor),
                        children: [
                          TextSpan(
                            text: sunrise ?? '-',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          )
                        ]))
              ],
            )),
        SizedBox(
            width: size.width * 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/800_night.png',
                  height: 48,
                  width: 48,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 8,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Sunset\n',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Palette.subTitleColor),
                        children: [
                          TextSpan(
                            text: sunset ?? '-',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          )
                        ]))
              ],
            ))
      ],
    );
  }
}