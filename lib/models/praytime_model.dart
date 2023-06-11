class PrayTimeModel {
  final String status;
  final Schedule jadwal;

  PrayTimeModel({
    required this.status,
    required this.jadwal,
  });

  factory PrayTimeModel.fromJson(Map<String, dynamic> json) => PrayTimeModel(
        status: json["status"],
        jadwal: Schedule.fromJson(json["jadwal"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "jadwal": jadwal.toJson(),
      };
}

class Schedule {
  final String status;
  final ScheduleData data;

  Schedule({
    required this.status,
    required this.data,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        status: json["status"],
        data: ScheduleData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class ScheduleData {
  final String ashar;
  final String dhuha;
  final String dzuhur;
  final String imsak;
  final String isya;
  final String maghrib;
  final String subuh;
  final String tanggal;
  final String terbit;

  ScheduleData({
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

  factory ScheduleData.fromJson(Map<String, dynamic> json) => ScheduleData(
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
