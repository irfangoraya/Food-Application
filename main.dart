import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app_flutter2/provider/my_provider.dart';
import 'package:food_app_flutter2/screens/checkout.dart';
import 'package:food_app_flutter2/screens/home.dart';
import 'package:food_app_flutter2/screens/login.dart';
import 'package:food_app_flutter2/screens/profile.dart';
import 'package:food_app_flutter2/screens/signUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (ctx)=>MyProvider(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            actionTextColor: Colors.white,
            backgroundColor: Colors.pinkAccent,
          ),
          primaryColor:Colors.pinkAccent,
          accentColor: Color(0xff04d4ee),
        ),
        title: "Food App",
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData)  {
              return HomePage();
            } else {
              return LoginPage();
            }
          }
        ),
      ),
    );
  }
}

