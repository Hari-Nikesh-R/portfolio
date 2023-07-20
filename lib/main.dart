
import 'package:flutter/material.dart';
import 'package:portfolio_hari_nikesh_r/di/locator.dart';
import 'package:portfolio_hari_nikesh_r/home/repository/HomeRepository.dart';
import 'package:portfolio_hari_nikesh_r/home/viewmodel/HomeViewModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/view/HomePageView.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  Widget app = MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.pink,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            iconTheme: IconThemeData(color: Colors.white60),
            actionsIconTheme: IconThemeData(color: Colors.amber),
            centerTitle: false,
            toolbarTextStyle: TextStyle(fontSize: 16, color: Colors.white),
            elevation: 15,
            titleTextStyle: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home_page' :(context) => const HomePageView(),
      },
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text("PortFolio", style: TextStyle(fontSize: 22),),
      actions: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          appBarPadding(const Text("About"), "About"),
          appBarPadding(const Text("Internships"), "Internships"),
          appBarPadding(const Text("Projects"), "Projects"),
          appBarPadding(const Text("Courses & Certificates"), "Courses & Certificates"),
        ],
      ),
      ],
    ),
      body:  const HomePageView()
    ),
  );
  setupLocator();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel(homeRepo: locator<HomeRepository>()))
        ],
        child: app,
      )
  );

}

Widget appBarPadding(Widget header, String clickEvent) {
   return Padding(padding: const EdgeInsets.all(12), child: GestureDetector(onTap:(){
     switch (clickEvent) {
       case "About":
         //todo: for about page
         debugPrint("About page");
         break;
         case "Internships":
         //todo: for Internships page
           debugPrint("Internships page");
         break;
       case "Projects":
       //todo: for Projects page
         debugPrint("Projects page");
         break;
       case "Courses & Certificates":
       //todo: for Courses page
         debugPrint("Courses page");
         break;
     }
   }, child: header));
}

