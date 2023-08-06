import 'package:flutter/material.dart';
import 'package:shop_app_flutter/screens/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel
{
  String image;
  String title;
  String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
});
}

class onBoarding extends StatefulWidget {

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  var borderController= PageController();

  List<BoardingModel> boarding =
  [
    BoardingModel(
        image: 'images/mobile.png',
        title: 'Find the item you have \n been looking for',
        body: 'Here you will see rich vjgvm h,sgb hg,dsbfv jbdsj',
    ),
    BoardingModel(
        image: 'images/speaker.png',
        title: 'Find the item you have \n been looking for',
        body: 'Here you will see rich vjgvm h,sgb hg,dsbfv jbdsj'
    ),
    BoardingModel(
        image: 'images/airpod.png',
        title: 'Find the item you have \n been looking for',
        body: 'Here you will see rich vjgvm h,sgb hg,dsbfv jbdsj'
    ),
  ];

  bool isLast= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, 'login');
            },
            child: Text(
              'SKIP',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
       ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: borderController,
                  onPageChanged: (int index){
                    if(index == boarding.length- 1){
                      setState(() {
                        isLast= true;
                      });
                    }
                    else {
                      isLast= false;
                    }
                  },
                  itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                  controller: borderController,
                  count: boarding.length,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 10,
                       dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      spacing: 5.0,
                    ),
              ),
                  const Spacer(),
                  FloatingActionButton(
                      onPressed: (){
                        if(isLast){
                          Navigator.pushReplacementNamed(context, 'login');

                        }
                        else {
                          borderController.nextPage(
                            duration: const Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                    child: const Icon(
                        Icons.arrow_forward_ios_outlined,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBoardingItem (BoardingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Image.asset(
      model.image,
      height: 250,
    ),
    const Spacer(),
    Text(
     model.title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 16,
    ),
    Text(
      model.body,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 10,
        color: Colors.grey,
      ),
    ),
    const Spacer(),
  ],
);
