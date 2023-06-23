import 'dart:convert';

List<Karyawan> karyawanFromJson(String str) =>
    List<Karyawan>.from(json.decode(str).map((x) => Karyawan.fromJson(x)));

String karyawanToJson(List<Karyawan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Karyawan {
  String name;
  String jobs;
  String id;

  Karyawan({
    required this.name,
    required this.jobs,
    required this.id,
  });

  Karyawan copyWith({
    String? name,
    String? jobs,
    String? id,
  }) =>
      Karyawan(
        name: name ?? this.name,
        jobs: jobs ?? this.jobs,
        id: id ?? this.id,
      );

  factory Karyawan.fromJson(Map<String, dynamic> json) => Karyawan(
        name: json["name"],
        jobs: json["jobs"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "jobs": jobs,
        "id": id,
      };

  @override
  String toString() => 'Karyawan(name: $name, jobs: $jobs, id: $id)';
}
