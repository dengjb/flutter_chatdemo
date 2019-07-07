
enum MessageType{
  MessageType_System,
  MessageType_Public,
  MessageType_Private,
  MessageType_Group,
}

class MessageData{
  String avatar;
  String name;
  String subTitle;
  DateTime dateTime;
  MessageType messageType;

  MessageData(this.avatar,this.name,this.subTitle,this.dateTime,this.messageType);
}