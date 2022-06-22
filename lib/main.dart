import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'feature/homepage/view/homepage_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (BuildContext , Orientation , ScreenType ) {
          return
          FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 100)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return GetMaterialApp(
                    title: 'Quiz App',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    home: const HomePageView(),
                  );
                } else {
                  return Container(color: Colors.white,);
                } // Return empty container to avoid build errors
              }
          );
        }
    );
  }
}


