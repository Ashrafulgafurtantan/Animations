import 'package:animationexample/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController animationController;
  Animation<double> boxAnimation;
  AnimationController boxanimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    boxanimationController =AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    boxAnimation = Tween(begin: 3.14*0.6,end: 3.14*0.65).animate(
      CurvedAnimation(
        curve: Curves.linear,
        parent: boxanimationController,
      ),
    ) ;
    boxAnimation.addStatusListener((status) {
      if(status ==AnimationStatus.completed){
        boxanimationController.reverse();
      }
      else if(status==AnimationStatus.dismissed){
        boxanimationController.forward();
      }
    });
    boxanimationController.forward();





    animationController =AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    catAnimation = Tween(begin: -35.0,end: -80.0).animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: animationController,
      ),
    ) ;




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Animation')),

      ),
      body: GestureDetector(
        child: Center(
          child: new Stack(
            overflow: Overflow.visible,
            children: <Widget>[

              buildCatAnimation(),
              buildBox(),

              buildLeftFlep(),
              buildRightFlep(),
            ],
          ),
        ),

        onTap: (){
          boxanimationController.stop();
        if(animationController.status == AnimationStatus.completed){
          boxanimationController.forward();
          animationController.reverse();

        }
        else if(animationController.status == AnimationStatus.dismissed){
          animationController.forward();
          boxanimationController.stop();


        }
      },),

    );
  }

  Widget buildCatAnimation(){

    return AnimatedBuilder(
        animation: catAnimation, 
        child: Cat(),

        builder: (context,child){
          return Positioned(
            child: child,
            top: catAnimation.value,
            right: 0.0,
            left: 0.0,
          );
        }


    );
  }


  buildBox(){
   return Container(
     height: 200,
    width: 200,
     color: Colors.brown[300],
   );
  }
  buildLeftFlep(){
    return Positioned(
      left: 3,
      child: AnimatedBuilder(
       animation: boxAnimation,
          child: Container(
            height: 10,
            width: 125,
            color: Colors.orangeAccent,
          ),

          builder:(context,child){
            return Transform.rotate(
              angle: boxAnimation.value,
            child: child,
              alignment: Alignment.topLeft,
            );
          }

      ),
    );
  }

  buildRightFlep(){
    return Positioned(
      right: 3,
      child: AnimatedBuilder(
          animation: boxAnimation,
          child: Container(
            height: 10,
            width: 125,
            color: Colors.orangeAccent,
          ),

          builder:(context,child){
            return Transform.rotate(
              angle: -boxAnimation.value,
              child: child,
              alignment: Alignment.topRight,
            );
          }

      ),
    );
  }
}
