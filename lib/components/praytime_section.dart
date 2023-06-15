import 'package:flutter/material.dart';
import 'package:limawaktu/app_styles.dart';
import 'package:limawaktu/models/praytime_model.dart';

import 'praytime_tile_component.dart';

class PrayTimeSection extends StatefulWidget {
  const PrayTimeSection({
    super.key,
    required this.scheduleData,
  });

  final ScheduleData scheduleData;

  @override
  State<PrayTimeSection> createState() => _PrayTimeSectionState();
}

class _PrayTimeSectionState extends State<PrayTimeSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.scheduleData.tanggal,
            style: CustomTextStyle.h2TextStyle
                .copyWith(color: AppColors.kblackTextColor),
          ),
          PrayTimeTileComponent(
            title: 'Subuh',
            time: widget.scheduleData.subuh,
          ),
          PrayTimeTileComponent(
            title: 'Dzuhur',
            time: widget.scheduleData.dzuhur,
          ),
          PrayTimeTileComponent(
            title: 'Ashar',
            time: widget.scheduleData.ashar,
          ),
          PrayTimeTileComponent(
            title: 'Maghrib',
            time: widget.scheduleData.maghrib,
          ),
          PrayTimeTileComponent(
            title: 'Isya',
            time: widget.scheduleData.isya,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Center(
            child: Text(
              'Pull Down to Refresh Prayer Time',
              style: CustomTextStyle.smallBodyTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
