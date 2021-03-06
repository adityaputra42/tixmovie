import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_movie/cubit/cubit.dart';

import 'package:tix_movie/ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => TicketCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/main': (context) => const MainPage(),
        },
      ),
    );
  }
}
