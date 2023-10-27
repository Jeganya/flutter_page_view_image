import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_page_view_image_jeganya/app_data.dart';
import 'package:flutter_page_view_image_jeganya/display_image.dart';

import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import 'indicator.dart';


class PageViewImageScreen extends StatefulWidget {
  const PageViewImageScreen({Key? key}) : super(key: key);

  @override
  State<PageViewImageScreen> createState() => _PageViewImageScreenState();
}

class _PageViewImageScreenState extends State<PageViewImageScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('William Shakespeare Quotes'),
        backgroundColor: Colors.indigo.shade900,
        actions: [
          PopupMenuButton<int>(
            itemBuilder:(context) => [
              PopupMenuItem(value:1, child: Text('Share'))
            ],
            onSelected: (value){
              if(value == 1){
                shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            width: 600,
            child:PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemCount:appDataList.length,
                itemBuilder:(context, Index){
                  return DisplayImage(
                    appData: appDataList[Index],
                  );
                }
            ) ,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appDataList.length,
                        (index) => Indicator(isActive: selectedIndex == index ? true : false)),
              ],
            ),
          ),
        ],
      ),

    );
  }
  shareInfo()async{
    ByteData imagebyte = await rootBundle.load(appDataList[selectedIndex].image);
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/download.jpg';
    File(path).writeAsBytesSync(imagebyte.buffer.asUint8List());
    await Share.shareFiles([path], text: 'Image Shared');
  }
}