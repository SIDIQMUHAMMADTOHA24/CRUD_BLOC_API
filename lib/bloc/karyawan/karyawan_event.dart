part of 'karyawan_bloc.dart';

abstract class KaryawanEvent extends Equatable {
  const KaryawanEvent();

  @override
  List<Object> get props => [];
}

class GetData extends KaryawanEvent {}

class AddData extends KaryawanEvent {}

class UpdateData extends KaryawanEvent {
  final int index;

  const UpdateData(this.index);
  @override
  List<Object> get props => [index];
}

class DeleteData extends KaryawanEvent {
  final int index;

  const DeleteData(this.index);
  @override
  List<Object> get props => [index];
}
