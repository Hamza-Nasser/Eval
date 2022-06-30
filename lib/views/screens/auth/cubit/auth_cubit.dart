import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/views/screens/auth/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  //TODO: remember to make get method as a static.
  static AuthCubit get(context) => BlocProvider.of(context);

  static String? userEmail;
  Future<void> verifyUserLogin(String email, String password) async {
    userEmail = email;
    emit(AuthLoginLoadingState());
    //..

    //  FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password)
    //       .then((value) => emit(AuthLoginSuccessState())).catchError((onError){
    //         emit(AuthLoginErrorState(errorMsg: onError.toString()));

    //       });
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(AuthLoginSuccessState());
      AuthLoginSuccessState.successMsg = 'Login Success';
    } on FirebaseAuthException catch (e) {
      emit(AuthLoginErrorState());
      AuthLoginErrorState.errorMsg = e.code;
      print(e.code);
    }
  }

  Future<void> registerNewUser(
      {required String email,
      required String password,
      required String phone,
      required String nickName}) async {
    emit(AuthRegisterLoadingState());

    //..
    try{
      var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await userCreateNew(
          email: email, name: nickName, phone: phone, uId: user.user!.uid);
      emit(AuthRegisterSuccessState());
      print(user.user!.email);
      print(user.user!.uid);

    }on FirebaseAuthException catch (e){
      emit(AuthRegisterErrorState());
      AuthUserCreateNewErrorState.errorMsg = e.code;

      print(e.code);
      print(onError.toString());
    }

    // FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(email: email, password: password)
    //     .then((value) async {
    //   await userCreateNew(
    //       email: email, name: nickName, phone: phone, uId: value.user!.uid);
    //   emit(AuthRegisterSuccessState());
    //   print(value.user!.email);
    //   print(value.user!.uid);
    // }).catchError((onError) {
    //   print(onError.toString());
    //   emit(AuthRegisterErrorState());
    // });
  }

  Future<void> userCreateNew(
      {required String? name,
      required String? email,
      required String? phone,
      required String? uId}) async {
    emit(AuthUserCreateNewLoadingState());
    UserModel userModel =
        UserModel(email: email, name: name, phone: phone, uId: uId);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel.toMap());
      emit(AuthUserCreateNewSuccessState());
      print('user created successfully');


    } on FirebaseAuthException catch (e) {
      emit(AuthUserCreateNewErrorState());

      print(e.code);
    }

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uId)
    //     .set(userModel.toMap())
    //     .then((value) {
    //   emit(AuthUserCreateNewSuccessState());
    //   print('user created successfully');
    // }).catchError((onError) {
    //   emit(AuthUserCreateNewErrorState());
    // });
  }

  void getForgottedPass() {
    emit(AuthForgotPasswordLoadingState());
    //..
  }
}
