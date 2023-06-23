import 'package:flutter/material.dart';
import 'package:rest_api_bloc/bloc/karyawan/export.dart';
import 'package:rest_api_bloc/view/home_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //! Get Data
        BlocProvider(
          create: (context) => KaryawanBloc()..add(GetData()),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeView(),
    );
  }
}
