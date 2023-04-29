import 'package:flutter/material.dart';
import 'package:flutter_app_6/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_app_6/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_app_6/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/chat-page.dart';
import 'Pages/login_page.dart';
import 'Pages/registr_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'cubits/chat_cubit/chat_cubit.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () {
      runApp(CarsChat());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class CarsChat extends StatelessWidget {
  const CarsChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context)=> RegistrCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.Id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
