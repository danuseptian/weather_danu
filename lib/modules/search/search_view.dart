import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_danu/modules/search/search_controller.dart';

import '../../widgets/weather_image.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  controller: controller.cityC,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'Search city',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.searchCity();
                        },
                        child: Icon(
                          Icons.search,
                          size: 35,
                        )),
                  ),
                ),
              ),
              GetBuilder<SearchController>(
                builder: (_) {
                  return controller.isLoading
                      ? Container(
                          child: Column(
                            children: [
                              Text(
                                'Your Location',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              GetBuilder<SearchController>(
                                builder: (_) {
                                  return Text(
                                    '${controller.weatherResponse?.cityName ?? ''}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  );
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GetBuilder<SearchController>(
                                    builder: (_) {
                                      return Text(
                                        '${controller.weatherResponse?.temp ?? ''}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 50,
                                        ),
                                      );
                                    },
                                  ),
                                  if (controller.weatherResponse?.temp != null)
                                    Text(
                                      '°F',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 10),
                              GetBuilder<SearchController>(
                                builder: (_) {
                                  return WeatherImage(
                                    imageAssetUrl: controller.weatherStatus(),
                                  );
                                },
                              ),
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Weather Detail',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Windspeed',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                'Timezone',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        GetBuilder<SearchController>(
                                          builder: (_) {
                                            return Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ' :  ${controller.weatherResponse?.windSpeed ?? ''}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' :  ${controller.weatherResponse?.timeZone ?? ''}',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
