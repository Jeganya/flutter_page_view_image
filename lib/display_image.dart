import 'package:flutter/material.dart';
import 'package:flutter_page_view_image_jeganya/app_data.dart';
import 'package:flutter_page_view_image_jeganya/pageview_image.dart';
class DisplayImage extends StatelessWidget {
  final AppDataImage appData;

  const DisplayImage({super.key, required this.appData});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image:AssetImage(appData.image),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}

