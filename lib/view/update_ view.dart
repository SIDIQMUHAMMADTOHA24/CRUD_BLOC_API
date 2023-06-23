import 'package:flutter/material.dart';
import 'package:rest_api_bloc/bloc/karyawan/export.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data'),
        centerTitle: true,
      ),
      body: ElevatedButton(
          onPressed: () {
            context.read<KaryawanBloc>().add(UpdateData(index));
            Navigator.pop(context);
          },
          child: const Text('Update')),
    );
  }
}
