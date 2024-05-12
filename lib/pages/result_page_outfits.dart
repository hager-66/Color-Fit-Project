import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../main_cubit/main_cubit.dart';

class ResultPageOutfits extends StatelessWidget {
  const ResultPageOutfits({super.key, required this.outfits});

  final String outfits;
  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Scaffold(
      appBar: AppBar(
        title: Text(outfits),
      ),
      body: GridView.count(
          crossAxisCount: 2,
        childAspectRatio: 0.5,
          children: List.generate(10, (index) {
            int indexRandom = random.nextInt(20);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          MainCubit.get(context).dataOutfits['products']
                          [indexRandom]['url'],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Color: ${MainCubit.get(context).dataOutfits['products'][indexRandom]['color']}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                    launchUrl(Uri.parse(MainCubit.get(context).dataOutfits['products']
                    [indexRandom]['link'].toString()));
                    },
                    child: const Text('Go to Product'),
                  ),
                ],
              ),
            );
          })

      ),
    );
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // Handle errors, e.g., display an error message
    print('Error');
    print('Could not launch $url');
  }
}
