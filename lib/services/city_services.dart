import 'package:dio/dio.dart';
import 'package:limawaktu/constant.dart';
import 'package:limawaktu/models/city.dart';

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
}
