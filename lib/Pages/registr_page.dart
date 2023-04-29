import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_6/Pages/login_page.dart';
import 'package:flutter_app_6/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter_app_6/helper/show-snack-bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constanse.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'chat-page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  static String Id = 'RegisterPage';
  String? Email;

  String? Password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegistrLoading) {
            isLoading = true;
          } else if (state is RegistrSuccess) {
            Navigator.pushNamed(context,ChatPage.id);
            isLoading = false;
          } else if (state is RegistrFailure) {
            scafoldmassage(context, state.errMassage);
            isLoading = false;
          }
        },
        builder: (context, State) => ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Form(
                    key: formKey,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Image.asset(
                          'assets/image/car1.png',
                          width: 300,
                          height: 200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Cars Chat',
                              style: TextStyle(
                                fontFamily: 'Spirax',
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                        Row(children: const [
                          Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 20,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomformTextField(
                            onChange: (date) {
                              Email = date;
                            },
                            hintText: 'Email',
                          ),
                        ),
                        CustomformTextField(
                          onChange: (date) {
                            Password = date;
                          },
                          hintText: 'Password',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .registerUser(
                                      email: Email!, password: Password!);
                            } else {}
                          },
                          buttonTo: 'Register',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('have an Account ?'),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                ' Login',
                                style: TextStyle(color: kPramairycolor),
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
