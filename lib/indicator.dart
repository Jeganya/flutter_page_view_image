import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration:Duration(microseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 4,vertical: 20),
      width: isActive ? 20 :10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.indigo :Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),

    );
  }
}
