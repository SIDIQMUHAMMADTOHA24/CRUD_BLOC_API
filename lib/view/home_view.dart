import 'package:flutter/material.dart';
import 'package:rest_api_bloc/bloc/karyawan/export.dart';
import 'package:rest_api_bloc/view/add_view.dart';
import 'package:rest_api_bloc/view/update_%20view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: BlocConsumer<KaryawanBloc, KaryawanState>(
        listener: (context, state) {
          if (state is KaryawanLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading...')));
          }
        },
        builder: (context, state) {
          if (state is KaryawanSuccess) {
            return ListView.builder(
                itemCount: state.listDataKaryawan.length,
                itemBuilder: (context, index) {
                  var data = state.listDataKaryawan[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.amber,
                      title: Text(data.name),
                      subtitle: Text(data.jobs),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UpdateView(
                                        index: int.parse(data.id),
                                      );
                                    },
                                  ));
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<KaryawanBloc>()
                                      .add(DeleteData(int.parse(data.id)));
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AddView();
              },
            ));
          }),
    );
  }
}
