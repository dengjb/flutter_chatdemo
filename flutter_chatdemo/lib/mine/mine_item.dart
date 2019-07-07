import 'package:flutter/material.dart';
import 'package:flutter_chatdemo/common/touch_callback.dart';
class MineItem extends StatelessWidget{
  final String title;
  final IconData iconData;
  final VoidCallback pressCb;

  MineItem({Key key,@required this.title,@required this.iconData,this.pressCb}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.white,
      child: TouchCallback(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Icon(iconData),
              ),
              Padding(padding: EdgeInsets.only(left: 15)),
              Text(title,style: TextStyle(fontSize: 15,color: Colors.black))
            ],
          ),
          onPressed: pressCb)
    );
  }

}