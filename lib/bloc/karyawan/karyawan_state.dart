part of 'karyawan_bloc.dart';

abstract class KaryawanState extends Equatable {
  const KaryawanState();

  @override
  List<Object> get props => [];
}

class KaryawanInitial extends KaryawanState {}

class KaryawanLoading extends KaryawanState {}

class KaryawanSuccess extends KaryawanState {
  final List<Karyawan> listDataKaryawan;

  const KaryawanSuccess(this.listDataKaryawan);
  @override
  List<Object> get props => [listDataKaryawan];
}

class KaryawanErorr extends KaryawanState {}
