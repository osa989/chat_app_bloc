import 'package:chatt_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatt_app/cubits/login_cubit/login_cubit.dart';
import 'package:chatt_app/cubits/register_cubit/register_cubit.dart';
import 'package:chatt_app/pages/chat_page.dart';
import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            LoginPage.id: (context) => LoginPage(),
            RegisterPage.id: (context) => RegisterPage(),
            ChatPage.id: (context) => ChatPage(),
          },
          initialRoute: LoginPage.id),
    );
  }
}
