import 'package:flutter/material.dart';
import 'package:tryflutter/Screens/ChatScreen.dart';

class AnimationScreen extends StatefulWidget{
  State createState() => new AnimationScreenState();
}

class AnimationScreenState extends State<AnimationScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    var animctrl = new AnimationController(
      duration: new Duration(milliseconds: 700),
      vsync: this,
    )
    
    var buttonLeft = new AnimButton(
      text: "Button",
      animationController:animctrl,
      action: () => animctrl.forward());

    return new Scaffold(
      appBar: new AppBar(title: new Text("AnimationButtons")),
      
      body: new Center(child : buttonLeft)

    );
  }

}

class AnimButton extends StatelessWidget{
  
  final String text;
  final AnimationController animationController;
  Function action;
  AnimButton({this.text,this.animationController,this.action});
  
  @override
  Widget build(BuildContext context) {
    
    var button = new RaisedButton(
      child: new Text(text),
      onPressed: action
    );

    var animicon =  new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController, curve: Curves.easeIn),
        axisAlignment: 0.0,
        child: new Icon(Icons.build,size: 256.0,)
    );

    var container = new Column(children: <Widget>[
        button,
        animicon
      ],
    );

    return container;

  }
  
}

