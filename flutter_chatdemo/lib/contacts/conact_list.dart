import 'package:flutter/material.dart';
import 'contact_item.dart';
import 'contact_item_ui.dart';

class ContactList extends StatefulWidget{

  final List<ContactVO> items;
  final IndexedWidgetBuilder headBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder sectionBuilder;
  final headItemCount; // 头部数据个数
  ContactList({@required this.headItemCount,@required this.items,this.headBuilder,@required this.itemBuilder,@required this.sectionBuilder});

  @override
  State<StatefulWidget> createState() {
    return new ContactListState();
  }

}

class ContactListState extends State<ContactList>{

  _showHeadView(index){
    if(index == 0 && widget.headBuilder != null){
      return Offstage(
        offstage: false,
        child: widget.headBuilder(context,index),
      );
    }
    return Container();
  }

  bool _shouldShowKeySection(index){
    // 除头部第一项，需要显示字母
    if(index<=0){
      return false;
    }
    int idx = index;
    int itemCount = widget.items.length;
    if(idx < itemCount ){
      if(widget.items[idx].sortKey != widget.items[idx-1].sortKey){
        return false;
      }
    }
    return true;
  }

  final ScrollController _scrollController = new ScrollController();
  bool _onNotification(ScrollNotification notification){
    return true;
  }

  int _getSectionCount(){
    int count = 0;
    String key = '';
    for(ContactVO it in widget.items){
      if(key.compareTo(it.sortKey) != 0){
        count++;
        key = it.sortKey;
      }
    }
    return count;
  }
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     body: Stack(
       children: <Widget>[
         NotificationListener(
           onNotification: _onNotification,
           child: ListView.builder(
             controller: _scrollController,
             physics: const AlwaysScrollableScrollPhysics(),
             itemCount: widget.items.length,
             itemBuilder: (BuildContext context, int index){
               return Container(
                 alignment: Alignment.centerLeft,
                 child: Column(
                     children: <Widget>[
                       _showHeadView(index),
                       Offstage(
                         offstage: _shouldShowKeySection(index),
                         child: widget.sectionBuilder(context,index),
                       ),
                       Column(
                         children: <Widget>[
                           widget.itemBuilder(context,index),
                         ],
                       )
                     ],
                 ),
               );
             },
           ),
         )
       ],
     ),
   );
  }

}