import 'package:dio/dio.dart';
import 'package:limawaktu/constant.dart';
import 'package:limawaktu/models/city.dart';
import 'package:limawaktu/models/praytime_model.dart';

class CityServices {
  final Dio dio = Dio();

  Future<List<CityModel>> getCities() async {
    final response = await dio.get('${Constants.apiURL}/kota');
    final data = response.data['kota'];
    return List<CityModel>.from(
      data.map(
        (cityData) => CityModel(
          id: cityData['id'],
          nama: cityData['nama'],
        ),
      ),
    );
  }

  Future<ScheduleData> getCityPraySchedule(String cityId, String date) async {
    final response =
        await dio.get('${Constants.apiURL}/jadwal/kota/$cityId/tanggal/$date');

    final data = response.data['jadwal'];
    return ScheduleData.fromJson(data['data']);
  }
}
