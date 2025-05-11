// lib/presentation/screens/auth/login_screen.dart
import 'package:appointment_users/data/models/requests/sign_up_request_model.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:appointment_users/presentation/blocs/auth/auth_cubit.dart';
import 'package:appointment_users/presentation/blocs/auth/auth_state.dart';
import 'package:appointment_users/presentation/blocs/home/home_cubit.dart';
import 'package:appointment_users/presentation/shared/widgets/loading_lottie.dart';
import 'package:appointment_users/router/screen_router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // if (_formKey.currentState?.validate() ?? false) {
    //   context.read<AuthCubit>().add(
    //     AuthSignInEvent(
    //       email: _emailController.text.trim(),
    //       password: _passwordController.text,
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => diContainer<AuthCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                debugPrint('AuthState: ${state}');
                state.whenOrNull(
                  signUpSuccess: (user) {
                    context.read<HomeCubit>().setUserAndSaveUid(user);
                    diContainer<ScreenRouterHelper>().navigateToHome();
                  },
                  signUpFailure: (errorMessage){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(errorMessage),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                );

              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: LoadingLottie(height: 100, width: 100),
                  );
                } else {
                  return SafeArea(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 12),
                              Text(
                                'Sign Up',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 48),
                              // AppTextField(
                              //   controller: _emailController,
                              //   labelText: 'Email',
                              //   prefixIcon: Icons.email_outlined,
                              //   keyboardType: TextInputType.emailAddress,
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Please enter your email';
                              //     }
                              //     if (!RegExp(
                              //       r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                              //     ).hasMatch(value)) {
                              //       return 'Please enter a valid email';
                              //     }
                              //     return null;
                              //   },
                              // ),
                              TextFormField(
                                controller: _userNameController,
                                decoration: InputDecoration(
                                  label: Text('User Name'),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  label: Text('Email'),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // AppTextField(
                              //   controller: _passwordController,
                              //   labelText: 'Password',
                              //   prefixIcon: Icons.lock_outline,
                              //   obscureText: !_isPasswordVisible,
                              //   suffixIcon: IconButton(
                              //     icon: Icon(
                              //       _isPasswordVisible
                              //           ? Icons.visibility_outlined
                              //           : Icons.visibility_off_outlined,
                              //     ),
                              //     onPressed: () {
                              //       setState(() {
                              //         _isPasswordVisible = !_isPasswordVisible;
                              //       });
                              //     },
                              //   ),
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Please enter your password';
                              //     }
                              //     return null;
                              //   },
                              // ),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  label: Text('Password'),
                                ),
                              ),
                              const SizedBox(height: 24),
                              // AppButton(text: 'Sign In', onPressed: _login),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    context.read<AuthCubit>().signUp(
                                      SignUpRequestModel(
                                        email: _emailController.text.trim(),
                                        password: _passwordController.text,
                                        name: _userNameController.text.trim(),
                                      ),
                                    );
                                  }
                                },
                                child: Text('Sign Up'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
