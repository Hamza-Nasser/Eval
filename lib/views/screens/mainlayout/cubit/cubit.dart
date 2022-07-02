import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eval/models/user_model.dart';
import 'package:eval/shared/constants.dart';
import 'package:eval/views/screens/mainlayout/cubit/states.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/chats.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/home.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/new_post.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/settings.dart';
import 'package:eval/views/screens/mainlayout/main_layout_modules/useres.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitStates>{
  AppCubit():super(AppCubitInitialState());


  static AppCubit get(context) => BlocProvider.of(context);
  final PageStorageBucket bucket = PageStorageBucket();

  //we are going to use PageStorage() to presist the pages states
  final List<Widget> screens = [
    const HomeModule(
      
      key: PageStorageKey('HomePage'),
    ),
    const ChatsModule(
      key: PageStorageKey('ChatsPage'),
    ),
    const NewPostModule(
      key: PageStorageKey('NewpostPage'),
    ),
    const UsersModule(
      key: PageStorageKey('UsersPage'),
    ),
    const SettingsModule(
      key: PageStorageKey('SettingsPage'),
    )

  ];
  List<String> titles =
  [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];



  int currentIndex = 0;
  void changeBottomNav(int index){
    currentIndex = index;
    emit(AppCubitChangeBottomNavBar());


  }
  UserModel? userModel;
  Future<void> getUserData()async{
    emit(AppCubitGetUserDataLoadingState());
       try{

        var model = await FirebaseFirestore.instance.collection('users').doc(Constants.uId).get();
        print(Constants.uId);
        emit(AppCubitGetUserDataSuccessState());


        userModel =  UserModel.formJson(model.data());
       }on FirebaseException catch (e){
        print(e.code);
        emit(AppCubitGetUserDataErrorState());
       }
     }

  
}