import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/user_model.dart';
import 'package:ecommerce/shared/constants.dart';
import 'package:ecommerce/views/screens/auth/cubit/states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  //TODO: remember to make get method as a static.
  static AuthCubit get(context) => BlocProvider.of(context);

  static String? userEmail;
  UserCredential? firestoreUser;
  //levi@gmail.com
  //01555223
  bool isAutherized = false;
  Future<void> verifyUserLogin(String email, String password) async {
    userEmail = email;
    emit(AuthLoginLoadingState());
    
    try {
      firestoreUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          print(firestoreUser!.user!.uid);
          Constants.uId = firestoreUser!.user!.uid;
          isAutherized = true;
      emit(AuthLoginSuccessState(firestoreUser!.user!.uid));
      
    } on FirebaseAuthException catch (e) {
      isAutherized =false;
      emit(AuthLoginErrorState());
      AuthLoginErrorState.errorMsg = e.code;
      print(e.code);
    }
  }

  Future<void> registerNewUser(
      {required String email,
      required String password,
      required String phone,
      required String name}) async {
    emit(AuthRegisterLoadingState());

    //..
    try{
      var newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await userCreateNew(
          email: email, name: name, phone: phone, uId: newUser.user!.uid);
      emit(AuthRegisterSuccessState());
      print(newUser.user!.email);
      print(newUser.user!.uid);

    }on FirebaseAuthException catch (e){
      emit(AuthRegisterErrorState());
      AuthUserCreateNewErrorState.errorMsg = e.code;

      print(e.code);
      print(onError.toString());
    }

    
  }
  
  static UserModel? userModel = UserModel(name: 'Hamza Nasser');
  Future<void> userCreateNew(
      {required String? name,
      required String? email,
      required String? phone,
      required String? uId}) async {
    emit(AuthUserCreateNewLoadingState());
    userModel =
        UserModel(email: email, name: name, phone: phone, uId: uId);
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(userModel!.toMap());
      emit(AuthUserCreateNewSuccessState());
      print('user created successfully');


    } on FirebaseAuthException catch (e) {
      emit(AuthUserCreateNewErrorState());

      print(e.code);
    }

   
     }
     

  void getForgottedPass() {
    emit(AuthForgotPasswordLoadingState());
    //..
  }
}
