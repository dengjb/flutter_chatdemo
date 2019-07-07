import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import 'contacts/contacts_page.dart';
import 'mine/mine_page.dart';
import 'package:flutter_chatdemo/common/build_popupmenu_item.dart';
import 'search/search_page.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }

}

enum PAGE_TYPE{
  PAGE_TYPE_MESSAGE,
  PAGE_TYPE_CONTACTS,
  PAGE_TYPE_MINE,
}
class _HomePageState extends State<HomePage>{
  int _currentPage = 0;
  MessagePage messagePage;
  ContactsPage contactsPage;
  MinePage minePage;
  Widget switchPage(){
    switch(_currentPage){
      case 0:
        if(messagePage == null){
          messagePage = new MessagePage();
        }
        return messagePage;
      case 1:
        if(contactsPage == null){
          contactsPage = new ContactsPage();
        }
        return contactsPage;
      case 2:
        if(minePage == null){
          minePage = new MinePage();
        }
        return minePage;
      default:
    }
  }

  List<BottomNavigationBarItem> baritems = [
    new BottomNavigationBarItem(icon: Icon(Icons.chat),title: Text('聊天'),activeIcon: Icon(Icons.chat_bubble)),
    new BottomNavigationBarItem(icon: Icon(Icons.contacts),title: Text('好友'),activeIcon: Icon(Icons.contact_mail)),
    new BottomNavigationBarItem(icon: Icon(Icons.people),title: Text('我的'),activeIcon: Icon(Icons.people_outline)),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
            'chatDemo',
          style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                return new SearchPage();
              }));
            },
            child: Icon(Icons.search),
          ),
          Padding(padding: EdgeInsets.only(left: 20,right: 30),
            child: GestureDetector(
              onTap: (){
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(300, 70, 50, 0),
                    items:<PopupMenuEntry>[
                      buildPopupMenuItemFunction('发起会话', Icons.chat_bubble),
                      buildPopupMenuItemFunction('添加好友', Icons.people),
                      buildPopupMenuItemFunction('联系客服', Icons.contacts)
                    ],);
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: switchPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: baritems,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            _currentPage = index;
          });
        },
        currentIndex: _currentPage,
      ),
    );
  }

}