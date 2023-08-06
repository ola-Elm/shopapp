import 'package:flutter/material.dart';
import 'package:shop_app_flutter/component/constant.dart';
import 'package:shop_app_flutter/model/product.dart';
import 'package:shop_app_flutter/widget/details/detailes_body.dart';

class DetailsScreen extends StatelessWidget {


  final Product? product ;
  DetailsScreen({
    this.product,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBody(
        product: product,
      ),
    );
  }

  //METHOD appBar
  AppBar detailsAppBar(context){
    return AppBar(
      elevation: 0.0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
      ),
      centerTitle: false,
      title: Text(
        'رجوع',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
