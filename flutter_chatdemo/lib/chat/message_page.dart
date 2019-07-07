import 'package:flutter/material.dart';
import 'message_data.dart';
import 'message_item.dart';

class MessagePage extends StatelessWidget{
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
      body:ListView.builder(itemBuilder: (BuildContext context, int index){
        return new MessageItem(_list[index]);
    },
      itemCount: _list.length)
    );
  }

}