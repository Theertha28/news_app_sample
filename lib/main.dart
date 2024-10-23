import 'package:flutter/material.dart';
import 'package:news_app_sample/controller/home_screen_controller.dart';
import 'package:news_app_sample/controller/search_screen_controller.dart';
import 'package:news_app_sample/view/bottom_navbar/bottom_navbar.dart';

import 'package:news_app_sample/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

void main(){
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SearchScreenController()),
        ChangeNotifierProvider(create: (context)=>HomeScreenController()),  
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavbar(),
      ),
    );
  }
}