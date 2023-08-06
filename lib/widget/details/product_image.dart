import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/constant.dart';

class ProductImage extends StatelessWidget {

  final Size size;
  final String? image;

  ProductImage({
    required this.size,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      height: size.width *0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width *0.7,
            width: size.width *0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image!,
            fit: BoxFit.cover,
            height: size.width *0.75,
            width: size.width *0.75,
          ),
        ],
      ),
    );
  }
}