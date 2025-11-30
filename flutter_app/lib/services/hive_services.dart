import 'package:hive/hive.dart';


import '../models/message.dart';

class HiveService{
  static const String boxName = "messagesBox";
  /// get box references

  static Box<Message> get box => Hive.box<Message>(boxName);

  ///load all messages
static List<Message> loadMessages(){
  return box.values.toList();
}


///save single message
static Future<void> saveMessage(Message message) async{
  await box.add(message);
}


}