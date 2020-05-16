import 'package:flutter/material.dart';
import 'package:resturant_video/color.dart';
import 'package:resturant_video/food.dart';

class FoodDetails extends StatelessWidget {
  Food food;

  FoodDetails(this.food);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              buildAddtoCart(size),
              buildQty(size),
              buildBodyTop(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBodyTop(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: size.width,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(10),
        )),
        margin: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    color: mainBlue),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildFaveIcon(),
            Center(
              child: Hero(
                tag: food.image,
                child: Image.asset(
                  food.image,
                  width: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 30),
              child: Text(
                '\$ ${food.price}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 25, color: mainBlue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10),
              child: Text(
                food.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 10),
              child: Text(
                food.description,
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  Widget buildFaveIcon() {
    return Row(
      children: <Widget>[
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          decoration: BoxDecoration(
              color: mainColorDark,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Image.asset(
            'images/Heart.png',
            color: food.isFave ? mainBlue : Colors.white,
            width: 18,
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget buildQty(Size size) {
    return Positioned(
      top: 500,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            ),
          color: mainColor,

        ),
        height: 150,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30,
              ),
              Text('Quantity',style: TextStyle(fontSize: 20),),
              Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Icon(Icons.remove,color: mainBlue,),
                ),
              ),
              SizedBox(width: 20,),
              Text('1',style: TextStyle(fontSize: 20),),
              SizedBox(width: 20,),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: Icon(Icons.add,color: mainBlue,),
                ),
              ),
              SizedBox(width: 10,)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAddtoCart(Size size) {
    return Positioned(
      top: 590,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(10),
          ),
          color: mainBlue,

        ),
        width: size.width,
        height: 200,
        child: Center(
          child: Text('Add to card',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    ) ;
  }
}
