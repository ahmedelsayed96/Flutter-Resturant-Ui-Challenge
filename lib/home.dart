import 'package:flutter/material.dart';
import 'package:resturant_video/color.dart';
import 'package:resturant_video/foodItem.dart';
import 'package:resturant_video/menuClip.dart';
import 'package:resturant_video/selected_clipper.dart';

import 'food.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 240, end: 240).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        body: Container(
          padding: EdgeInsets.only(top:40),
          width: size.width,
          child: Stack(
            children: <Widget>[
              buildMenuBarr(size),
              buildSelectedContainer(),
              buildBody(size)
            ],
          ),
        ),

    );
  }

  Widget buildMenuBarr(Size size) {
    return ClipPath(
      clipper: MenuClip(),
      child: Container(
        height: size.height,
        width: 55,
        color: mainColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Image.asset(
              'images/menu.png',
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/Search.png',
              width: 50,
              height: 50,
            ),
            SizedBox(
              height: 40,
            ),
            buildRotatedBox('My Profile', 0),
            buildRotatedBox('Notification', 1),
            buildRotatedBox('Invoice', 2),
            buildRotatedBox('Home', 3),
            Image.asset(
              'images/cart.png',
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRotatedBox(String text, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          animation = Tween<double>(
                  begin: 240.0 + (currentIndex * 100),
                  end: 240.0 + (index * 100))
              .animate(controller);
          currentIndex = index;
        });
        controller.forward(from: 0);
      },
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          width: 100,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildSelectedContainer() {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return Positioned(
            left: 55,
            top: animation.value,
            child: ClipPath(
              clipper: SelectedClip(),
              child: Container(
                color: mainColor,
                width: 50,
                height: 100,
              ),
            ),
          );
        });
  }

  Widget buildBody(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Food & Delivery',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          buildTabBar(),
          SizedBox(
            height: 20,
          ),
          Text('Near You',
          style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getNearYouList().map((e) => FoodItem(e)).toList()
            ),
          ),
          SizedBox(height: 20,),
          Text('Popular',
            style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: getPopular().map((e) => FoodItem(e)).toList()
            ),
          ),
          SizedBox(height: 20,),
          buildViewAllText(),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Text('Asian')),
          Text('American'),
          Text('French'),
          Text('Mexico'),
        ],
      ),
    );
  }
  List<Food> getNearYouList() {
    List<Food> list = [];

    list.add(Food('images/Chicken_Hamburger.png', 'Chicken Hamburger',
        'Fresh hamburger with \nchicken, salad, tomatoes.', true, 30.00));
    list.add(Food('images/Dragon_Fruits_Salad.png', 'Dragon Fruits Salad',
        'A bit of avocado salad \nand some spinach stalks.', true, 18.00));

    return list;
  }

  List<Food> getPopular() {
    List<Food> list = [];

    list.add(Food('images/Salmon_Sushi.png', 'Salmon Sushi',
        'Salmon, carrot rolls, \nspinach and some sauce.', false, 28.00));
    list.add(Food('images/Avocado_Salad.png', 'Avocado Salad',
        'Fresh hamburger with \nchicken, salad, tomatoes.', true, 11.00));

    return list;
  }

  Widget buildViewAllText() {
    return Row(
      children: <Widget>[
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          decoration: BoxDecoration(
            color: mainBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )
          ),
          child:Text('View All',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),) ,
        ),
        SizedBox(width: 20,)
      ],
    );
  }

}
