import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.fill),
            ),
            child: ListView(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Lottie.asset('assets/lotties/cloudy.json'),
                ),
                Container(
                  height: 100,
                  child: Lottie.asset('assets/lotties/welcome.json'),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/water_on_screen.png'),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ],
      ),
    );
  }
}
