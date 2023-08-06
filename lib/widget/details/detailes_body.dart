import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/constant.dart';
import 'package:shop_app_flutter/model/product.dart';
import 'package:shop_app_flutter/widget/details/color_dot.dart';
import 'package:shop_app_flutter/widget/details/product_image.dart';

class DetailsBody extends StatelessWidget {

   final Product? product ;
   DetailsBody({
    this.product,

});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: ProductImage(
                      size: size,
                  //image: 'assets/airpod.png',
                  image: product!.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   ColorDot(
                     fillColor: kTextLightColor,
                     isSelected: true,
                   ),

                    ColorDot(
                      fillColor: Colors.blue,
                      isSelected: false,
                    ),

                    ColorDot(
                      fillColor: Colors.red,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding /2),
                child: Text(
                    product!.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
                Text(
                   'السعر: \$${product!.price}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding /2 ),
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5 ,
            vertical:  kDefaultPadding /2 ,
          ),
          child: Text(
             product!.description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
            ),
          ),
        ),
      ],
    );
  }
}