import 'package:aetheris/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MiscDataWidget extends StatelessWidget {
  final double? pressure;
  final double? humidity;
  final double? visibility;
  final double? wind;

  final double? seaLevelPressure;
  final double? groundLevelPressure;

  const MiscDataWidget(
      {super.key,
      this.pressure,
      this.humidity,
      this.visibility,
      this.wind,
      this.seaLevelPressure,
      this.groundLevelPressure});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade900.withOpacity(0.5),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
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
                        'assets/icons/wind.png',
                        height: 48,
                        width: 48,
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Wind\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                          children: [
                            TextSpan(
                              text:
                                  '${wind?.round().toString()} Kmph',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/301.png',
                        height: 48,
                        width: 48,
                        fit: BoxFit.scaleDown,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Humidity\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                          children: [
                            TextSpan(
                              text: '${humidity?.round().toString()} %',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        CupertinoIcons.speedometer,
                        color: Colors.white,
                        size: 48,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Pressure\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                          children: [
                            TextSpan(
                              text: '${pressure?.round().toString()} millibars',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                  width: size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.visibility_outlined,
                        color: Colors.white,
                        size: 48,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Visibility\n',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Palette.subTitleColor),
                          children: [
                            TextSpan(
                              text: '${visibility?.round().toString()} Km',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    ).animate().fadeIn(
        duration: const Duration(seconds: 2),
        begin: 0,
        curve: Curves.easeInOut);
  }
}
