import 'package:chatt_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:chatt_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatt_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatt_app/pages/chat_page.dart';
import 'package:chatt_app/pages/login_page.dart';
import 'package:chatt_app/pages/register_page.dart';
import 'package:chatt_app/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  
 Bloc.observer = SimpleBlocObserver();  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthBloc()),
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
