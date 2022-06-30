import 'package:ecommerce/shared/constants.dart';
import 'package:ecommerce/utilities/extensions/fade_extinsion.dart';
import 'package:ecommerce/views/screens/auth/cubit/auth_cubit.dart';
import 'package:ecommerce/views/screens/auth/cubit/states.dart';
import 'package:ecommerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController(text: AuthCubit.userEmail);
    final nickNameController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthRegisterSuccessState) {
          Fluttertoast.showToast(msg: 'Successfully created');
        } else if (state is AuthRegisterErrorState) {
          Fluttertoast.showToast(
              msg: AuthUserCreateNewErrorState.errorMsg.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Constants.defaultPadding),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: nickNameController,
                        validator: (value) =>
                            value!.isEmpty ? 'please enter a valid name' : null,
                        decoration: const InputDecoration(
                          labelText: 'Nickname',
                        ),
                      ).fadeInList(0, false),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: emailController,
                        onChanged: (value) {
                          AuthCubit.userEmail = value;
                        },
                        validator: (value) => value!.isEmpty
                            ? 'please enter a valid Email'
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ).fadeInList(1, false),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) => value!.isEmpty
                            ? 'Please enter a valid password'
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'New password',
                        ),
                      ).fadeInList(2, false),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: phoneController,
                        validator: (value) => value!.isEmpty
                            ? 'Please enter a valid phone number'
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                        ),
                      ).fadeInList(3, false),
                      const SizedBox(
                        height: 10,
                      ),
                      MainButton(
                          text: 'Register',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).registerNewUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  nickName: nickNameController.text,
                                  phone: phoneController.text);
                            }
                          }).fadeInList(4, true),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      color: Theme.of(context).primaryColor),
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
      },
    );
  }
}
