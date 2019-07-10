import 'package:flutter/material.dart';
import 'contact_item.dart';

class ContactItemUI extends StatelessWidget{
  final ContactVO item;
  final String headTitle;
  final String headImg;

  final String defaultUrl = 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1471973000827&di=b3f0a9fc3c63ff507741c32808962dbb&imgtype=jpg&src=http%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db10000_10000%26sec%3D1471962622%26di%3Df679407ce9d44f27e090427e86c78a9d%26src%3Dhttp%3A%2F%2Ftva4.sinaimg.cn%2Fcrop.0.0.1242.1242.1024%2Fbf7038fdjw8f1wj0qjwqpj20yi0yiac6.jpg';
  ContactItemUI({Key key,this.item,this.headTitle,this.headImg}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5,color: Color(0xffd9d9d9))),
      ),
      height: 52,
      child: FlatButton(
          onPressed: (){},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              headImg == null ? Image.network(item.avatarUrl != '' ? item.avatarUrl : defaultUrl,height: 36,width: 36,scale: 0.9)
                  : Image.asset(headImg,height: 36,width: 36),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(headTitle == null ? item.title : headTitle,maxLines: 1,
                style: TextStyle(fontSize: 18,color: Color(0xff353535))),
              )
            ],
          ),
      ),
    );
  }

}