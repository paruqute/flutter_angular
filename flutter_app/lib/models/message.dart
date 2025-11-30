
import 'package:hive/hive.dart';
part 'message.g.dart';

@HiveType(typeId: 1)
class Message{
  @HiveField(0)
  final String text;

  @HiveField(1)
  final DateTime timeStamp;

  @HiveField(2)
  final bool isSendByMe;

Message({required this.text, required this.timeStamp, required this.isSendByMe});
}

