

import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/constant.dart';
import 'package:shop_app_flutter/model/product.dart';
import 'package:shop_app_flutter/screens/details_screen.dart';
import 'package:shop_app_flutter/widget/home/product_cart.dart';

class HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      bottom: false,
        child: Column(
           children: [
             const SizedBox(height: kDefaultPadding / 2,),
             Expanded(
               child: Stack(
                  children: [
                     Container(
                       margin: const EdgeInsets.only(top: 70.0),
                       decoration: const BoxDecoration(
                         color: kBackgroundColor,
                         borderRadius: BorderRadius.only(
                             topRight:Radius.circular(40),
                             topLeft:  Radius.circular(40),
                         ),
                       ),
                     ),
                    ////////////////////////////
                    ListView.builder(
                      itemCount: products.length,
                        itemBuilder: (context, index) => ProductCard(
                          itemIndex: index,
                          product: products[index],
                          press: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                {
                                  return DetailsScreen(
                                    product: products[index],
                                  );
                            }));
                          },
                        ),
                    ),

        ],
        ),
        ),
        ],
        ),
    );
   }

}