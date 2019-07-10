import 'package:flutter/material.dart';
import 'conact_list.dart';
import 'contact_item.dart';
import 'conact_head.dart';
import 'contact_item_ui.dart';

class ContactsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ContactState();
  }


}

class ContactState extends State<ContactsPage>{

  static final String defaultUrl = 'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1471973000827&di=b3f0a9fc3c63ff507741c32808962dbb&imgtype=jpg&src=http%3A%2F%2Ftimgsa.baidu.com%2Ftimg%3Fimage%26quality%3D80%26size%3Db10000_10000%26sec%3D1471962622%26di%3Df679407ce9d44f27e090427e86c78a9d%26src%3Dhttp%3A%2F%2Ftva4.sinaimg.cn%2Fcrop.0.0.1242.1242.1024%2Fbf7038fdjw8f1wj0qjwqpj20yi0yiac6.jpg';
 final List<ContactVO> _list = [
    new ContactVO(sortKey: 'A', title: '阿明', avatarUrl: defaultUrl),
    new ContactVO(sortKey: 'A', title: '阿康', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'F', title: '飞飞', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'G', title: '格格', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'X', title: '谢训', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'Y', title: '杨坤', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'Y', title: '杨康', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'Y', title: '杨过', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'Z', title: '赵敏', avatarUrl: defaultUrl),
   new ContactVO(sortKey: 'Z', title: '张无忌', avatarUrl: defaultUrl),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ContactList(
        itemBuilder: (BuildContext context,int index){
          return ContactItemUI(item: _list[index]);
        },
        items: _list,
        headItemCount: 2,
        headBuilder: (BuildContext context,int index){
          return ContactHead();
        },
        sectionBuilder:(BuildContext context,int index){
          return Container(
            height: 32,
            padding: EdgeInsets.only(left: 14),
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            child: Text(_list[index].sortKey,
                style: TextStyle(fontSize: 14,color: Color(0xff909090)),),
          );
        },
      ),
    );
  }

}