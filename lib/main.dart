import 'package:bloc/bloc.dart';
import 'package:ecommerce/shared/constants.dart';
import 'package:ecommerce/utilities/routing/router.dart';
import 'package:ecommerce/utilities/routing/routes.dart';
import 'package:ecommerce/shared/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  BlocOverrides.runZoned(
    () {
      // Use blocs...
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontFamily: 'Cario',
            color: Colors.black
          ),
          headline5: TextStyle(
            fontFamily: 'Cario',
          ),
        ),
        primarySwatch: Colors.red,
        primaryColor: Colors.red.shade700,
        scaffoldBackgroundColor: Colors.white,
        //background: rgba(249, 249, 249, 1);
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
          )
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(Constants.defaultRadius / 4)
            ),
            borderSide: BorderSide(
              color: Colors.red.shade700,
            )),
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          labelStyle: Theme.of(context).textTheme.subtitle1,
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Constants.defaultRadius / 4)
            ),
            
          
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Constants.defaultRadius / 4)
            ),
            borderSide: BorderSide(
              color: Colors.grey
            )
            
          
        ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Constants.defaultRadius / 4)
            ),
            borderSide: BorderSide(
              color: Colors.grey
            ))
            
        ),
        
        
      ),
      onGenerateRoute: _appRouter.onGenerate,
      initialRoute: AppRoutes.loginScreenRoute,
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _appRouter.dispose();
    super.dispose();
  }
}
