import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


import '../models/message.dart';
import '../utils/color.dart';

class ChatGroupHeader extends StatelessWidget {
  const ChatGroupHeader({
    super.key,
    required this.message,
  });
final Message message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Center(
        child: Card(
          elevation: 0,
          color: primaryColor.withValues(alpha: 0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat.yMMMd().format(message.timeStamp),
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: backgroundColor),
            ),
          ),
        ),
      ),
    );
  }
}