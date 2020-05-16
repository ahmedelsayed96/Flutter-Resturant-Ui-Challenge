import 'package:flutter/material.dart';
import 'package:resturant_video/color.dart';
import 'package:resturant_video/food_details.dart';

import 'food.dart';

class FoodItem extends StatelessWidget {
  Food food;

  FoodItem(this.food);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>FoodDetails(food))),
      child: Container(
        margin: EdgeInsets.only(right: 20),
        height: 200,
        width: size.width / 2,
        child: Stack(
          children: <Widget>[
            buildCard(),
            buildImage()
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Hero(
      tag: food.image,
      child: Image.asset(food.image,width: 110,height: 110,),
    );
  }

  Widget buildCard() {
    return Container(
      margin: EdgeInsets.only(top: 5,left: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10,),
            buildIcon(),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Text('\$ ${food.price}',style: TextStyle(color: mainBlue,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(food.name,style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(food.description,style: TextStyle(fontSize: 12,color: Colors.grey),),
            )

          ],
        ),
      ),
    );
  }

  Widget buildIcon() {
    return Row(children: <Widget>[
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9,vertical: 6),
              decoration: BoxDecoration(
                color: mainColorDark,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
              ),
              child: Image.asset('images/Heart.png',width: 25,color: food.isFave?mainBlue:Colors.white,),

            ),SizedBox(width: 5,)
          ],);
  }
}
