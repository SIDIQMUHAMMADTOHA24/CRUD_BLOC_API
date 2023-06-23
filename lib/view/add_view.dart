import 'package:flutter/material.dart';
import 'package:rest_api_bloc/bloc/karyawan/export.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                //! Add Data
                context.read<KaryawanBloc>().add(AddData());
                Navigator.pop(context);
              },
              child: const Text('Add Data'))),
    );
  }
}
