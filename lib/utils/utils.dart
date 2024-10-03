import 'package:flutter/material.dart';

spaceHeight(height) => SizedBox(height: double.parse(height.toString()));

spaceWidth(width) => SizedBox(width: double.parse(width.toString()));

sH(context) => MediaQuery.of(context).size.height;

sW(context) => MediaQuery.of(context).size.width;

responsiveCount(context)=>sW(context) <= 720?2:sW(context) >= 720 && sW(context) <= 1000?3:4;
responsiveWidth(context)=>sW(context) <= 720?200:sW(context) >= 720 && sW(context) <= 1000?300:400;

Center loading() {
  return const Center(
    child: CircularProgressIndicator(
        // color: mainClr,
        color: Colors.black,
        ),
  );
}

error(String error) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 50,
        ),
        spaceHeight(10),
        Text(error)
      ],
    ),
  );
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
