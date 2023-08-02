import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/modules/welcome/cubit/welcome_cubit.dart';

import 'app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<WelcomeCubit>(
          create: (context) => WelcomeCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
