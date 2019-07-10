import 'package:flutter/material.dart';
import 'contact_item_ui.dart';

class ContactHead extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ContactItemUI(headTitle: '添加好友',headImg: 'images/icon_qq_fill.png'),
        ContactItemUI(headTitle: '聊天室',headImg: 'images/icon_addperson.png'),
      ],
    );
  }

}