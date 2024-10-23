import 'package:flutter/material.dart';
import 'package:news_app_sample/view/home_screen/home_screen.dart';
import 'package:news_app_sample/view/profile_screen/profile_screen.dart';
import 'package:news_app_sample/view/search_screen/search_screen.dart';


class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List Screens=[
    HomeScreen(),
    SearchScreen(),
    ProfileScreen()

   
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: Screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        // selectedLabelStyle: TextStyle(fontSize: 10,),
        // unselectedLabelStyle: TextStyle(fontSize: 10,),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orange.shade200,
        unselectedItemColor: Colors.white,
        
       items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "profile"),
        
        
      ],
      onTap: (value){
        selectedIndex=value;
      setState(() {});
      },
      ),
      
    );
  }
}