import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_button.dart';
import 'match_outfits_page.dart';

class ResultPhotoDetect extends StatelessWidget {
  const ResultPhotoDetect({super.key, required this.image,required this.data});

  final File? image;

  final dynamic data ;
  String get s => 'login';




  @override
  Widget build(BuildContext context) {
    List<Color> flutterColors = extractColors(data);
    List<Color> flutterColorsRandom = extractColorsRandomColors(data);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result of the photo'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Image.file(image!,fit: BoxFit.cover,),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Result of Dominant Colors',
              style: TextStyle(
                fontSize: 15,
                color: kPrimaryColor,
              ),
            ),
            Column(
              children: flutterColors.map((Color color) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: color,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        data['dominant_colors'][flutterColors.indexOf(color)].toString().split(' ')[0],
                        style: const TextStyle(
                          color: Colors.black, // Change text color based on background for better visibility
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            const Text(
              'Result of Match Colors',
              style: TextStyle(
                fontSize: 15,
                color: kPrimaryColor,
              ),
            ),
            Column(
              children: flutterColorsRandom.map((Color color) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                          color: color,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        data['random_colors'][flutterColorsRandom.indexOf(color)].toString().split(' ')[0],
                        style: const TextStyle(
                          color: Colors.black, // Change text color based on background for better visibility
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButon(
                s,
                text: 'Match outfits',
                onTap: () {
                  Navigator.pushNamed(context, MatchoutfittsPage.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Color bgrToColor(int r, int g, int b) {
  return Color.fromRGBO(r, g, b, 1);
}

// Function to extract and convert BGR color data
List<Color> extractColors(Map<String, dynamic> data) {
  List<Color> colors = [];
  List<dynamic> dominantColors = data['dominant_colors'];
  for (String color in dominantColors) {
    // Extract BGR values
    RegExp regex = RegExp(r"\((\d+), (\d+), (\d+)\)");
    List<Match> matches = regex.allMatches(color).toList();
    if (matches.isNotEmpty && matches[0].groupCount == 3) {
      int r = int.parse(matches[0].group(1)!);
      int g = int.parse(matches[0].group(2)!);
      int b = int.parse(matches[0].group(3)!);
      // Convert BGR to Flutter Color and add to the list
      colors.add(bgrToColor(r, g, b));
    }
  }
  return colors;
}


Color bgrToColorRandomColors(int r, int g, int b) {
  return Color.fromRGBO(r, g, b, 1);
}

// Function to extract and convert BGR color data
List<Color> extractColorsRandomColors(Map<String, dynamic> data) {
  List<Color> colors = [];
  List<dynamic> randomColors = data['random_colors'];
  for (String color in randomColors) {
    // Extract BGR values
    RegExp regex = RegExp(r"\((\d+), (\d+), (\d+)\)");
    List<Match> matches = regex.allMatches(color).toList();
    if (matches.isNotEmpty && matches[0].groupCount == 3) {
      int r = int.parse(matches[0].group(1)!);
      int g = int.parse(matches[0].group(2)!);
      int b = int.parse(matches[0].group(3)!);
      // Convert BGR to Flutter Color and add to the list
      colors.add(bgrToColorRandomColors(r, g, b));
    }
  }
  return colors;
}