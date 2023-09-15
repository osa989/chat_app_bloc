import 'package:chatt_app/constants.dart';
import 'package:chatt_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatt_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chatt_app/pages/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            BlocProvider.of<ChatCubit>(context).getMessage();
            Navigator.pushNamed(context, ChatPage.id, arguments: email!);
            isLoading = false;
          } else if (state is RegisterFailure) {
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
                          height: 100,
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            "Scholar Chat",
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
                            "REGISTER",
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
                          hintText: "Password",
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .registerUser(
                                      email: email!, password: password!);
                            } else {}
                          },
                          title: "Register",
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "already have an acount?",
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                " LOGIN",
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
            ));
  }
}
