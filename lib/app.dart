import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/modules/welcome/cubit/welcome_cubit.dart';
import 'package:gurte_jaba/modules/welcome/view/welcome_page.dart';

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
      home: BlocBuilder<WelcomeCubit, WelcomeState>(
        builder: (context, state) {
          if (state.status == WelcomeStatus.initial) {
            return const WelcomePage();
          } else if (state.status == WelcomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {}
          return const WelcomePage();
        },
      ),
    );
  }
}
