import 'package:flutter/material.dart';
import 'mine_item.dart';
import 'package:flutter_chatdemo/common/touch_callback.dart';

class MinePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:ListView(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 60,
            child:  TouchCallback(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 5,right: 5,bottom: 5),
                      color: Colors.white,
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg'),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('一休哥',style: TextStyle(fontSize: 16,color: Color(0xff353535)),maxLines: 1),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          Text('账号：yixiu',style: TextStyle(fontSize: 14,color:Color(0xffa9a9a9)),maxLines: 1)
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 5,right: 10,bottom: 10),
                      child: Icon(Icons.contacts),
                    )
                  ],
                ),
                onPressed: (){

                })
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          new MineItem(title: '好友动态',iconData: Icons.people_outline),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            color: Colors.white,
            height: 165,
            child: Column(
              children: <Widget>[
                new MineItem(title: '好友消息', iconData: Icons.message),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                new MineItem(title: '我的相册', iconData: Icons.bubble_chart),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                new MineItem(title: '我的文件', iconData: Icons.attach_file),
                Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xffd9d9d9),
                  ),
                ),
                new MineItem(title: '联系客服', iconData: Icons.perm_camera_mic),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          new MineItem(title: '清理缓存', iconData: Icons.clear),
        ],
      )
    );
  }

}