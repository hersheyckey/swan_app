import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swaan_app/presentation/bloc/login_bloc/login_bloc_event.dart';
import 'package:swaan_app/presentation/bloc/login_bloc/login_bloc_state.dart';
import 'package:swaan_app/presentation/screens/login/widget/textformfied_widget.dart';
import 'package:swaan_app/resources/asset_manager.dart';

import '../../bloc/login_bloc/login_bloc_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              AssetManager.loginBG,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormFieldWidget(
                    suffixIcon: Icon(Icons.forward_to_inbox_outlined,
                        color: Colors.white),
                    controller: _emailController,
                    labelText: 'Email or Phone',
                    isPassword: false,
                  ),
                  SizedBox(height: 16.0),
                  TextFormFieldWidget(
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    controller: _passwordController,
                    labelText: 'Password',
                    isPassword: true,
                  ),
                  SizedBox(height: 16.0),
                  Align(
                      alignment: Alignment.topRight,
                      child: Text("Forgot Password.?",style: TextStyle(color: Colors.white),)),
                  SizedBox(height: 20,),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return state is LoginLoading
                          ? CircularProgressIndicator()
                          : Container(
                        height: 50,
                              width: double.maxFinite,
                              child: ElevatedButton(
                                onPressed: () {
                                  print('Login Button Pressed');
                                  context.read<LoginBloc>().add(
                                        LoginSubmitted(
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ),
                                      );
                                },
                                child: Text('Sign in ',style: TextStyle(color: Colors.black),),
                              ),
                            );
                    },
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        print('Login Successful');
                        Navigator.pushNamed(context, '/home');
                      } else if (state is LoginFailure) {
                        print('Login Failed');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Phone number is wrong')),
                        );
                      }
                    },
                    child: Container(),
                  ),

                  SizedBox(height: 20,),

                  Align(
                      alignment: Alignment.center,
                      child: Text("Don’t Have a account? Create Account ",style: TextStyle(color: Colors.white),)),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
