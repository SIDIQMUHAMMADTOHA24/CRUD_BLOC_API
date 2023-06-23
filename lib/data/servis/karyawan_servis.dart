import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../model/karyawan_model.dart';

class KaryawanServis {
  String url = 'https://6487a169beba62972790dc46.mockapi.io/personal';

  //!GET DATA
  //http
  Future<List<Karyawan>> getDatapertama() async {
    try {
      var response = await http.get(Uri.parse(url));

      return karyawanFromJson(response.body);
    } catch (e) {
      throw '$e';
    }
  }

  //dio
  Future<List<Karyawan>> getData() async {
    try {
      var response = await Dio().get(url);
      List<Karyawan> listOfKaryawan = response.data
          .map<Karyawan>((e) => Karyawan.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      return listOfKaryawan;
    } catch (e) {
      throw '$e';
    }
  }

  //!Add Data
  Future<List<Karyawan>> addData() async {
    try {
      var response =
          await Dio().post(url, data: {'name': 'toha', 'jobs': 'programmer'});
      Karyawan addedKaryawan =
          Karyawan.fromJson(Map<String, dynamic>.from(response.data));

      // Memperoleh data Karyawan yang sudah ada sebelumnya (jika ada)
      List<Karyawan> existingData = await getData();

      // Memeriksa apakah data Karyawan sudah ada sebelumnya
      bool isDuplicate =
          existingData.any((karyawan) => karyawan.id == addedKaryawan.id);

      if (!isDuplicate) {
        // Menambahkan Karyawan baru ke dalam List jika tidak ada duplikat
        existingData.add(addedKaryawan);
      }

      return existingData;
    } catch (e) {
      throw '$e';
    }
  }

  //!Update Data
  Future<List<Karyawan>> updateData(int index) async {
    try {
      var response = await Dio()
          .put('$url/$index', data: {'name': 'dono', 'jobs': 'supir'});
      Karyawan updatedData =
          Karyawan.fromJson(Map<String, dynamic>.from(response.data));
      // Memperoleh data Karyawan yang sudah ada sebelumnya (jika ada)
      List<Karyawan> existingData = await getData();
      // Memeriksa apakah data Karyawan sudah ada sebelumnya
      bool isDuplicate =
          existingData.any((karyawan) => karyawan.id == updatedData.id);

      if (!isDuplicate) {
        // Menambahkan Karyawan baru ke dalam List jika tidak ada duplikat
        existingData.add(updatedData);
      }

      return existingData;
    } catch (e) {
      throw '$e';
    }
  }

  //!Delete Data
  Future<List<Karyawan>> deleteData(int karyawanId) async {
    try {
      // Mengirim permintaan DELETE ke URL dengan karyawanId yang ditentukan
      await Dio().delete('$url/$karyawanId');

      // Memperoleh data Karyawan yang sudah ada sebelumnya
      List<Karyawan> existingData = await getData();

      // Menghapus Karyawan dari List berdasarkan karyawanId
      existingData.removeWhere((karyawan) => karyawan.id == karyawanId);

      return existingData;
    } catch (e) {
      throw '$e';
    }
  }
}
