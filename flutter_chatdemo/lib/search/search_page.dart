import 'package:flutter/material.dart';
import 'package:flutter_chatdemo/common/touch_callback.dart';

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new SearchState();
  }

}

class SearchState extends State<SearchPage>{

  _getText(String title){
    return new TouchCallback(
        child: Text(title,style: TextStyle(fontSize: 14,color: Color(0xff1aad19))),
        isfeed: false,
        onPressed: (){}
        );
  }

  FocusNode _focusNode = new FocusNode();

  _requestFocus(){
    FocusScope.of(context).requestFocus(_focusNode);
    return _focusNode;
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       margin: const EdgeInsets.only(top: 25),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           // 若在这里使用row会报错，原因不明
           new Stack(
             //crossAxisAlignment: CrossAxisAlignment.center,
             //mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               new TouchCallback(
                   child:Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 10),
                       child: Icon(Icons.chevron_left,color: Colors.black)),
                   onPressed: (){
                     Navigator.pop(context);
                   }
                   ),
               Container(
                 alignment: Alignment.centerLeft,
                 margin: EdgeInsets.only(left: 40),
                 height: 45,
                 decoration:BoxDecoration(
                   border: Border(
                     bottom: BorderSide(width: 1,color: Colors.green),
                   )
                 ) ,
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     Expanded(
                     child: TextField(
                         focusNode: _requestFocus(),
                         style: TextStyle(color: Colors.black,fontSize: 15),
                         onChanged: (String text){},
                         decoration: InputDecoration(
                             hintText: '在这里搜索',
                             border: InputBorder.none),
                          ),
                      ),
                     Container(
                       margin: EdgeInsets.only(right: 10),
                       child: Icon(Icons.mic,color: Color(0xffaaaaaa)),
                     )
                   ],
                 ),
               ),
             ],
           ),
           Container(
             margin: EdgeInsets.only(top: 40),
             child: Text('常用搜索',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Color(0xffb5b5b5))),
             alignment: Alignment.center,
           ),
           Padding(
             padding: EdgeInsets.all(20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 _getText('朋友'),
                 _getText('聊天'),
                 _getText('群组'),
               ],
             ),
           ),
           Padding(
             padding: EdgeInsets.all(20),
             child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               _getText('google'),
               _getText('baidu'),
               _getText('alibaba'),
             ],
           ),
           )
         ],
       ),
     )
   );
  }

}