import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../constants/images.dart';
import '../controller/HomeController.dart';

class MyCard extends GetView<HomeController> {



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter:
          ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: AssetImage(
            'assets/images/cloud-in-blue-sky.jpg',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: TextField(
              onChanged: (value) => controller.city = value,
              style: const TextStyle(
                color: Colors.white,
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => controller.updateWeather(),
              decoration: InputDecoration(
                suffix: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintStyle: const TextStyle(color: Colors.white),
                hintText: 'Search'.toUpperCase(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Align(
            alignment:const Alignment(0.0, 1.0),
            child: SizedBox(
              height: 10,
              width: 10,
              child: OverflowBox(
                minWidth: 0.0,
                maxWidth: MediaQuery.of(context).size.width,
                minHeight: 0.0,
                maxHeight: (MediaQuery.of(context).size.height / 4),
                child: Stack(
                  children: [
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children:[
                            Container(
                              padding:const EdgeInsets.only(
                                  top: 15, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text('${controller.currentWeatherData.name}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Colors.black45,
                                        fontSize: 24,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontFamily:
                                        'flutterfonts',
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                        color: Colors.black45,
                                        fontSize: 16,
                                        fontFamily:
                                        'flutterfonts',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Column(
                                    children: [
                                      Text(
                                       // ignore: unnecessary_string_interpolations
                                       '${controller.currentWeatherData.weather![0].description}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                          color: Colors.black45,
                                          fontSize: 22,
                                          fontFamily:
                                          'flutterfonts',
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text('${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2!
                                            .copyWith(
                                            color: Colors.black45,
                                            fontFamily:
                                            'flutterfonts'),
                                      ),
                                      Text(
                                       'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).
                                       round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15)
                                           .round().toString()}\u2103',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontFamily:
                                          'flutterfonts',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: LottieBuilder.asset(
                                            Images.cloudyAnim),
                                      ),
                                      Text(
                                        'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                          color: Colors.black45,
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontFamily:
                                          'flutterfonts',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
