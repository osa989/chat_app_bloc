import 'package:chatt_app/constants.dart';
import 'package:chatt_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatt_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatt_app/pages/chat_page.dart';
import 'package:chatt_app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, ChatPage.id, arguments: email!);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBarss(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 75),
                  Image.asset(
                    kLogo,
                    height: 100, // you should specify the height with listview
                  ),
                  Container(
                    width: double.infinity,
                    // alignment: Alignment.center,
                    child: Text(
                      "Scholar Chat ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'pacifico'),
                    ),
                  ),
                  SizedBox(height: 75),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "LOGIN",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: "Email",
                  ),
                  SizedBox(height: 10),
                  CustomFormTextField(
                    onChanged: (data) {
                      password = data;
                    },
                    obscureText: true,
                    hintText: "Password",
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context)
                            .loginUser(email: email!, password: password!);
                      } else {}
                    },
                    title: "Login",
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have an acount?",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: Text(
                          " REGISTER",
                          style: TextStyle(color: Color(0xffc7ede6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
