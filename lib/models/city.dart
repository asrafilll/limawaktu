class CityResponse {
  final String status;
  final List<CityModel> kota;

  CityResponse({
    required this.status,
    required this.kota,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
        status: json["status"],
        kota: List<CityModel>.from(
            json["kota"].map((x) => CityModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "kota": List<dynamic>.from(kota.map((x) => x.toJson())),
      };
}

class CityModel {
  final String id;
  final String nama;

  CityModel({
    required this.id,
    required this.nama,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
      };
}
