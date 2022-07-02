import 'package:eval/shared/constants.dart';
import 'package:eval/utilities/extensions/fade_extinsion.dart';
import 'package:eval/views/screens/auth/cubit/auth_cubit.dart';
import 'package:eval/views/screens/auth/cubit/states.dart';
import 'package:eval/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController(text: AuthCubit.userEmail);
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
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
            body: Padding(
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
                      MainButton(
                          text: 'Verify',
                          onTap: () {
                            if (formKey.currentState!.validate()) {}
                          }).fadeInList(4, true),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
