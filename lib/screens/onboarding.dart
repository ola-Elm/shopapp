import 'package:flutter/material.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: onBoardingContent(),
        ),
      ),
    );
  }
}

class onBoardingContent extends StatelessWidget {
  const onBoardingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "images/mobile.png",
          height: 250,
        ),
        const Spacer(),
        Text(
          'Find the item you have \n been looking for',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Here you will see rich app tpo  kjd snjgvnd ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
