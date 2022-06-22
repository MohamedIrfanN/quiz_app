import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final width = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
final height = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;


const snackBar = SnackBar(
  content: Text("Please select an option"),
);


final loading = Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    LoadingAnimationWidget.newtonCradle(
      color: Colors.indigoAccent,
      // rightDotColor: Colors.indigoAccent,
      // leftDotColor: Colors.pink,
      size: 120,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Text("Don't panic, Just count to infinite.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey[800]),)
      ],
    )
  ],
);

final kSizedBox = SizedBox(height: height*0.05,);