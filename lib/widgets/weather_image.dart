import 'package:flutter/material.dart';

class WeatherImage extends StatelessWidget {
  final String? imageAssetUrl;
  const WeatherImage({Key? key, this.imageAssetUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('${imageAssetUrl ?? 'assets/icons/rain.png'}')),
      ),
    );
  }
}
