import 'package:flutter/material.dart';
import 'message_data.dart';
import 'message_item.dart';



class MessagePageState extends State<MessagePage>{

  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  
  List<MessageData> _list = [
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '一休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '二休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '三休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '四休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '五休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '六休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
    new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '七休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public),
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:RefreshIndicator(
          child: ListView.builder(itemBuilder: (BuildContext context, int index){
            if(index == _list.length){
              return _buildProgressView();
            }
            return new MessageItem(_list[index]);
          }, itemCount: _list.length + 1,
              controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics()),
          onRefresh: _refreshData)
    );
  }

  @override
  void initState(){
    super.initState();
    _scrollController.addListener(_loadMoreCallback);
  }
  @override
  void dispose(){
    super.dispose();
    _scrollController.removeListener(_loadMoreCallback);
  }


  Future<Null> _refreshData()async{
    await Future.delayed(Duration(seconds: 2),(){
      setState(() {
        _list.clear();
        loadNewData();
      });
    });

  }

  loadNewData(){
    for(int i=0; i<20;i++){
      _list.add( new MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '四休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public));
    }
  }

  _loadMoreCallback(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      _getMoreData();
    }
  }

  _getMoreData() async {
    if(!isPerformingRequest){
      setState(() {
        isPerformingRequest = true;
      });
      List<MessageData> addList = await fakeRequest(_list.length, _list.length+10);
      for(MessageData item in addList){
        print("moredata,item=" + item.toString());
      }
      setState(() {
        _list.addAll(addList);
        isPerformingRequest = false;
      });
    }
  }

  Future<List<MessageData>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      //return List.generate(to - from, (i) => i + from);
      return List.generate(to-from, (i){
        return new  MessageData('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1496749007691&di=c617d738afd0df0018dec340601e044b&imgtype=0&src=http%3A%2F%2Fimg.faxingw.cn%2F201505%2F7cd60d0828381f30e99b929dac014c086f06f079.jpg', '999休哥', '每天光头很凉快', new DateTime.now(), MessageType.MessageType_Public);
      });
    });
  }

  Widget _buildProgressView(){
    return Padding(
        padding: EdgeInsets.all(10.0),
      child: Center(
        child: Opacity(
            opacity: isPerformingRequest ? 1.0 : 0.0,
            child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

}

class MessagePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MessagePageState();
  }


}