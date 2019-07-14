import 'package:flutter/material.dart';
import 'message_data.dart';
import 'package:flutter_chatdemo/common/touch_callback.dart';
import 'package:date_format/date_format.dart';

class MessageItem extends StatefulWidget{
  MessageData messageData;
  MessageItem(this.messageData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MessageItemState();
  }


}

class MessageItemState extends State<MessageItem>{
  @override
  Widget build(BuildContext context) {
   return new Container(
     decoration: BoxDecoration(
        color: Colors.white,
       border: Border(bottom: BorderSide(color: Color(0xffd9d9d9),width: 0.5)),
     ),
     height: 64.0,
     child: TouchCallback(
         child: Row(
           crossAxisAlignment:CrossAxisAlignment.center,
           children: <Widget>[
             Container(
               padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
               child: Image.network(widget.messageData.avatar),
             ),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(widget.messageData.name,style: TextStyle(fontSize: 16,color: Color(0xff353535)),maxLines: 1),
                   Padding(padding: EdgeInsets.only(top: 8)),
                   Text(widget.messageData.subTitle,style: TextStyle(fontSize: 14,color:Color(0xffa9a9a9)),maxLines: 1)
                 ],
               ),
             ),
             Container(
               alignment: AlignmentDirectional.topStart,
               margin: EdgeInsets.only(top: 10,right: 10),
               child: Text(formatDate(widget.messageData.dateTime, [HH,':',nn,':',ss]),style: TextStyle(fontSize: 14,color: Color(0xffa9a9a9))),
             ),
           ],
         ),
         onPressed: (){

         }),
   );
  }

}
