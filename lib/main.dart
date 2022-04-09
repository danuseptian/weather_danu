import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_danu/utilities/welcome_screen.dart';

import 'modules/home/home_view.dart';
import 'services/geolocation_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocationService.locationPermission();
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      title: 'Weather Danu',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 3),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomeView();
          }
          return WelcomeScreen();
        },
      ),
    );
  }
}
