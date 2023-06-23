import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_api_bloc/data/servis/karyawan_servis.dart';

import '../../data/model/karyawan_model.dart';

part 'karyawan_event.dart';
part 'karyawan_state.dart';

class KaryawanBloc extends Bloc<KaryawanEvent, KaryawanState> {
  KaryawanBloc() : super(KaryawanInitial()) {
    //!Get Data
    on<GetData>((event, emit) async {
      emit(KaryawanLoading());
      List<Karyawan> data = await KaryawanServis().getData();
      emit(KaryawanSuccess(data));
    });

    //!Add Data
    on<AddData>((event, emit) async {
      emit(KaryawanLoading());
      List<Karyawan> data = await KaryawanServis().addData();
      emit(KaryawanSuccess(data));
    });

    //!Update Data
    on<UpdateData>((event, emit) async {
      emit(KaryawanLoading());
      List<Karyawan> data = await KaryawanServis().updateData(event.index);
      emit(KaryawanSuccess(data));
    });

    //! Delete Data
    on<DeleteData>((event, emit) async {
      emit(KaryawanLoading());
      List<Karyawan> data = await KaryawanServis().deleteData(event.index);
      emit(KaryawanSuccess(data));
    });
  }
}
