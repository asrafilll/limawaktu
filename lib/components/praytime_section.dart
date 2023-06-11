import 'package:flutter/material.dart';
import 'package:limawaktu/app_styles.dart';
import 'package:limawaktu/models/praytime_model.dart';

import 'praytime_tile_component.dart';

class PrayTimeSection extends StatelessWidget {
  const PrayTimeSection({
    super.key,
    required this.scheduleData,
  });

  final ScheduleData scheduleData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            scheduleData.tanggal,
            style: CustomTextStyle.h2TextStyle
                .copyWith(color: AppColors.kblackTextColor),
          ),
          PrayTimeTileComponent(
            title: 'Subuh',
            time: scheduleData.subuh,
          ),
          PrayTimeTileComponent(
            title: 'Dzuhur',
            time: scheduleData.dzuhur,
          ),
          PrayTimeTileComponent(
            title: 'Ashar',
            time: scheduleData.ashar,
          ),
          PrayTimeTileComponent(
            title: 'Maghrib',
            time: scheduleData.maghrib,
          ),
          PrayTimeTileComponent(
            title: 'Isya',
            time: scheduleData.isya,
          ),
        ],
      ),
    );
  }
}
