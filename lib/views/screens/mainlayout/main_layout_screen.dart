import 'package:ecommerce/shared/icon_broken.dart';
import 'package:ecommerce/views/screens/mainlayout/cubit/cubit.dart';
import 'package:ecommerce/views/screens/mainlayout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var appCubit = AppCubit.get(context);
        return WillPopScope(
          onWillPop: exitApp,

          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              
              backgroundColor: Colors.white,
              title: Text(
                appCubit.titles[appCubit.currentIndex],
                style: Theme.of(context).textTheme.headline5,
              ),
        
            ),
            body: appCubit.screens[appCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: appCubit.currentIndex,
              onTap: (index){
                appCubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat),
                  label: 'Chats'
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Plus),
                  label: 'New Post'
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.User),
                  label: 'Users'
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting),
                  label: 'Settings'
                ),
              ],
              
              
              
            ),
          ),
        );
      },
    );
  }
}

Future<bool> exitApp()async{
  SystemNavigator.pop().then((value) => true);
  return false;

}
