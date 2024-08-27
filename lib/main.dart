import 'dart:async';

import 'package:egm/bloc/auth/auth_bloc.dart';
import 'package:egm/bloc/main/main_bloc.dart';
import 'package:egm/data/repository/user_repository.dart';
import 'package:egm/firebase_options.dart';
import 'package:egm/presentation/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(UserRepository())..add(AuthStarted()),
        ),
        BlocProvider(create: (context) => MainBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return const MainScreen();
            // if (state is AuthAuthenticated) {
            //   return const MainScreen();
            // } else {
            //   return const Scaffold(
            //     body: Center(
            //       child: CircularProgressIndicator(),
            //     ),
            //   );
            // }
          },
        ),
      ),
    );
  }
}
