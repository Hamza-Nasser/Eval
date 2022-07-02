import 'package:eval/shared/constants.dart';
import 'package:eval/utilities/extensions/fade_extinsion.dart';
import 'package:eval/utilities/routing/routes.dart';
import 'package:eval/views/screens/auth/cubit/auth_cubit.dart';
import 'package:eval/views/screens/auth/cubit/states.dart';
import 'package:eval/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController(
      text: AuthCubit.userEmail
    );
    final passwordController = TextEditingController();
    
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if(state is AuthLoginErrorState){
          Fluttertoast.showToast(msg: AuthLoginErrorState.errorMsg??'Anonymous Error');
        }
        if(state is AuthLoginSuccessState){
        var authCubit = AuthCubit.get(context);
          
          Fluttertoast.showToast(msg: authCubit.firestoreUser!.user!.uid);
        }
      },
      builder: (context, state) {
        
        var authCubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
           
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.defaultPadding),
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('assets/valorantLogo.png')
                          .fadeInList(4, true),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Login with your riot account',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: Colors.black54))
                          .fadeInList(0, false),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //_buildForm(context, authType),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextFormField(
                            controller: emailController,
                            onChanged: (value){
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
                                ? 'please enter a valid Password'
                                : null,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                          ).fadeInList(2, false),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.forgotPassScreenRoute);
                            },
                            child: Text(
                              'Forgot your password?',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ).fadeInList(3, false),
                          const SizedBox(
                            height: 10,
                          ),
                          MainButton(
                              text: 'Login',
                              
                              onTap: () {
                                    //Navigator.pushReplacementNamed(context, AppRoutes.mainLayoutScreenRoute);
                                   
                                
                                if (formKey.currentState!.validate()) {
                                 
                                  authCubit.verifyUserLogin(emailController.text, passwordController.text).then((value){
                                    if(authCubit.isAutherized) {
                                      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.mainLayoutScreenRoute, (route) => false);

                                    } else {

                                    }
                                  });
                                }
                              }).fadeInList(4, true),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.registerScreenRoute);
                                },
                                child: Text(
                                  'Register',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text('Or login with social account')),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Constants.defaultRadius),
                              color: Colors.grey.shade100,
                            ),
                            child: const Icon(Icons.flutter_dash_outlined)),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  Constants.defaultRadius),
                              color: Colors.grey.shade100,
                            ),
                            child: const Icon(Icons.flutter_dash))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
// class BuildForm extends StatefulWidget {
//   const BuildForm({Key? key,}) : super(key: key);

//   @override
//   State<BuildForm> createState() => _BuildFormState();
// }

// class _BuildFormState extends State<BuildForm> {
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     var authType = AuthFormType.login;
//     return Form(
//     key: formKey,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         TextFormField(
//           validator: (value) =>
//               value!.isEmpty ? 'please enter a valid value' : null,
//           decoration: const InputDecoration(
//             labelText: 'Email',
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//           validator: (value) =>
//               value!.isEmpty ? 'please enter a valid value' : null,
//           decoration: const InputDecoration(
//             labelText: 'Password',
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         if (authType == AuthFormType.login)
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Forgot your password?',
//               style: Theme.of(context).textTheme.subtitle2,
//             ),
//           ),
//         const SizedBox(
//           height: 10,
//         ),
//         MainButton(
//             text: authType==AuthFormType.login?'Login':'Register',
//             onTap: () {
//               if (formKey.currentState!.validate()) {}
//             }),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               authType==AuthFormType.login?'Don\'t have an account? ':'Already have an account?',
//               style: Theme.of(context).textTheme.subtitle2,
//             ),
//             TextButton(
//               onPressed: () {

//               },
//               child: Text(
//                 authType==AuthFormType.login?'Register':'Login',
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle2!
//                     .copyWith(color: Theme.of(context).primaryColor),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
//   }
// }
// Widget _buildForm(BuildContext context, AuthFormType authType) {
//   final formKey = GlobalKey<FormState>();
//   return Form(
//     key: formKey,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         TextFormField(
//           validator: (value) =>
//               value!.isEmpty ? 'please enter a valid value' : null,
//           decoration: const InputDecoration(
//             labelText: 'Email',
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         TextFormField(
//           validator: (value) =>
//               value!.isEmpty ? 'please enter a valid value' : null,
//           decoration: const InputDecoration(
//             labelText: 'Password',
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         if (authType == AuthFormType.login)
//           TextButton(
//             onPressed: () {},
//             child: Text(
//               'Forgot your password?',
//               style: Theme.of(context).textTheme.subtitle2,
//             ),
//           ),
//         const SizedBox(
//           height: 10,
//         ),
//         MainButton(
//             text: authType == AuthFormType.login ? 'Login' : 'Register',
//             onTap: () {
//               if (formKey.currentState!.validate()) {}
//             }),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               authType == AuthFormType.login
//                   ? 'Don\'t have an account? '
//                   : 'Already have an account?',
//               style: Theme.of(context).textTheme.subtitle2,
//             ),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 authType == AuthFormType.login ? 'Register' : 'Login',
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle2!
//                     .copyWith(color: Theme.of(context).primaryColor),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }
