import 'package:carconnect/models/models.dart';
import 'package:carconnect/models/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:carconnect/Pages/welcomepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

void main() async {
  Hive.init(null);
  runApp(const CarConnect());
}

class CarConnect extends StatefulWidget {
  const CarConnect({super.key});

  @override
  State<CarConnect> createState() => _CarConnectState();
}

class _CarConnectState extends State<CarConnect> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(User()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sage',
        theme: ThemeData(
          // useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 32, 5, 152),
        ),
        home: const WelcomePage(),
      ),
    );
  }
}