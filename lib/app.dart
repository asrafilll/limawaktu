import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:limawaktu/app_styles.dart';
import 'package:limawaktu/components/mainheader_bg_component.dart';
import 'package:limawaktu/components/search_form.dart';
import 'package:limawaktu/models/praytime_model.dart';
import 'package:limawaktu/services/city_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/praytime_section.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({super.key});

  @override
  State<GettingStartedScreen> createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  String locationName = 'Select Your Location';
  final CityServices service = CityServices();

  ScheduleData? prayTimeData;

  Future<void> loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      locationName = prefs.getString('locationName') ?? 'Select Your Location';
      String? prayTimeDataString = prefs.getString('prayTimeData');
      prayTimeData = prayTimeDataString != null
          ? ScheduleData.fromJson(jsonDecode(prayTimeDataString))
          : null;
    });
  }

  Future<void> saveDataToStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locationName', locationName);
    await prefs.setString('prayTimeData', jsonEncode(prayTimeData?.toJson()));
  }

  Future<void> handleCitySelected(String cityId) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    prayTimeData = await service.getCityPraySchedule(cityId, formattedDate);
    setState(() {});
    await saveDataToStorage();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => handleCitySelected(locationName),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const MainHeaderBGComponent(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.17,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lima Waktu',
                        style: CustomTextStyle.h2TextStyle,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        padding: const EdgeInsets.only(left: 24, top: 32),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20.0,
                              offset: const Offset(0.0, 0.4),
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'You are currently at',
                              style: CustomTextStyle.smallBodyTextStyle,
                            ),
                            const SizedBox(height: 8),
                            InkWell(
                              onTap: () async {
                                locationName = await showSearch(
                                  context: context,
                                  delegate: SearchForm(
                                    onCitySelected: handleCitySelected,
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: AppColors.kLightBlueColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    locationName,
                                    style: CustomTextStyle.h2TextStyle.copyWith(
                                      color: AppColors.kLightBlueColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 28),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 46),
            prayTimeData == null
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Center(child: Text('Select Your Location First ')),
                  )
                : _PrayTimeSection(prayTimeData: prayTimeData)
          ],
        ),
      ),
    );
  }
}

class _PrayTimeSection extends StatelessWidget {
  const _PrayTimeSection({
    required this.prayTimeData,
  });

  final ScheduleData? prayTimeData;

  @override
  Widget build(BuildContext context) {
    return PrayTimeSection(
      scheduleData: prayTimeData!,
    );
  }
}
