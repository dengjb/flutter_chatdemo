import 'package:flutter/material.dart';

class TouchCallback extends StatefulWidget{
  final Widget child;
  final VoidCallback onPressed;
  final bool isfeed;
  final Color color;

 TouchCallback({Key key,@required this.child,@required this.onPressed,this.isfeed:true,this.color:const Color(0xffd8d8d8)}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return new TouchCallbackState();
  }

}

class TouchCallbackState extends State<TouchCallback>{
  Color _color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        color: _color,
        child: widget.child,
      ),
      onPanDown: (d){
        if(widget.isfeed == false) return;
        setState(() {
          _color = widget.color;
        });
      },
      onPanCancel:(){
        setState(() {
          _color = Colors.transparent;
        });
      } ,
    );
  }

}