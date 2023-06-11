import 'package:flutter/material.dart';
import 'package:limawaktu/app_styles.dart';

class PrayTimeTileComponent extends StatelessWidget {
  const PrayTimeTileComponent(
      {super.key, required this.title, required this.time});

  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: CustomTextStyle.prayTimeTextStyle,
            ),
            Text(
              time,
              style: CustomTextStyle.prayTimeTextStyle,
            ),
          ],
        )
      ],
    );
  }
}
