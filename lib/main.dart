import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_screen.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),

        )
      ],
    );
  }
}

