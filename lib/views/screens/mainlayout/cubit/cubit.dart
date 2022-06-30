import 'package:ecommerce/views/screens/mainlayout/cubit/states.dart';
import 'package:ecommerce/views/screens/mainlayout/main_layout_modules/chats.dart';
import 'package:ecommerce/views/screens/mainlayout/main_layout_modules/home.dart';
import 'package:ecommerce/views/screens/mainlayout/main_layout_modules/new_post.dart';
import 'package:ecommerce/views/screens/mainlayout/main_layout_modules/settings.dart';
import 'package:ecommerce/views/screens/mainlayout/main_layout_modules/useres.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppCubitStates>{
  AppCubit():super(AppCubitInitialState());


  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeModule(),
    const ChatsModule(),
    const NewPostModule(),
    const UsersModule(),
    const SettingsModule()

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

  
}