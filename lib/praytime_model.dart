class PrayTimeModel {
  final String status;
  final Query query;
  final Jadwal jadwal;

  PrayTimeModel({
    required this.status,
    required this.query,
    required this.jadwal,
  });

  factory PrayTimeModel.fromJson(Map<String, dynamic> json) => PrayTimeModel(
        status: json["status"],
        query: Query.fromJson(json["query"]),
        jadwal: Jadwal.fromJson(json["jadwal"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "query": query.toJson(),
        "jadwal": jadwal.toJson(),
      };
}

class Jadwal {
  final String status;
  final Data data;

  Jadwal({
    required this.status,
    required this.data,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  final String ashar;
  final String dhuha;
  final String dzuhur;
  final String imsak;
  final String isya;
  final String maghrib;
  final String subuh;
  final String tanggal;
  final String terbit;

  Data({
    required this.ashar,
    required this.dhuha,
    required this.dzuhur,
    required this.imsak,
    required this.isya,
    required this.maghrib,
    required this.subuh,
    required this.tanggal,
    required this.terbit,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ashar: json["ashar"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        imsak: json["imsak"],
        isya: json["isya"],
        maghrib: json["maghrib"],
        subuh: json["subuh"],
        tanggal: json["tanggal"],
        terbit: json["terbit"],
      );

  Map<String, dynamic> toJson() => {
        "ashar": ashar,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "imsak": imsak,
        "isya": isya,
        "maghrib": maghrib,
        "subuh": subuh,
        "tanggal": tanggal,
        "terbit": terbit,
      };
}

class Query {
  final String format;
  final String kota;
  final DateTime tanggal;

  Query({
    required this.format,
    required this.kota,
    required this.tanggal,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        format: json["format"],
        kota: json["kota"],
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "kota": kota,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
      };
}
