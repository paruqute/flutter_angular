import 'package:flutter/cupertino.dart';


import '../models/message.dart';
import '../services/hive_services.dart';

class ChatProvider extends ChangeNotifier {



   List<Message> _messages = [];

  List<Message> get messageLists => _messages;

  int _unreadCount = 0;

  int get unreadCount => _unreadCount;




  ///load all messages from hive

  void loadMessages(){
    _messages = HiveService.loadMessages();

      notifyListeners();
  }

  ///save message

  Future<void> _saveMessage(Message message)async{
    await HiveService.saveMessage(message);

  }
  // send user messages

  void sendMessage(String text) {

    final textMessage = Message(
      text: text,
      timeStamp: DateTime.now(),
      isSendByMe: true,
    );
    _messages.add(
      textMessage
    );
    _saveMessage(textMessage);

    notifyListeners();
    _sendAutoReply();
  }

  //send auto reply

Future<void> _sendAutoReply() async{
    
    await Future.delayed(Duration(seconds: 1));

    final replies = [
      "Hi! How can i help you?",
      "Sure, One moment",
      "Thanks for your messages!",
      "I'm here to help you"
    ];

    final replyText = replies[_messages.length % replies.length];  //auto reply will rotate instead of picking the same one
final textMessage = Message(text: replyText, timeStamp: DateTime.now(), isSendByMe: false);
  _messages.add(
    textMessage
  );
  _saveMessage(textMessage);

  _unreadCount++;
  notifyListeners();
}

void markAllAsRead(){
    _unreadCount = 0;
    notifyListeners();
}
}
