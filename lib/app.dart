import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/shared/shared.dart';

import 'modules/cubit/app_cubit.dart';
import 'modules/cubit/app_cubit_logic.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gurte Jaba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AppCubit>(
        create: (context) => AppCubit(data: RepositoryImpl()),
        child: const AppCubitLogic(),
      ),
    );
  }
}
