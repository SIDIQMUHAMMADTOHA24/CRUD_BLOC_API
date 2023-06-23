
import 'package:rest_api_bloc/data/servis/karyawan_servis.dart';

void main() async {
  KaryawanServis karyawanServis = KaryawanServis();

  // print(await karyawanServis.getDatapertama());
  print(await karyawanServis.updateData(2));

  // print(await karyawanServis.deleteData());
}
