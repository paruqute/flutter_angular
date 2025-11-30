import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/message.dart';
import '../utils/color.dart';


class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
  });

  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isSendByMe
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 2.h,bottom: 2.h),
        padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 8.h),

        decoration: BoxDecoration(
          color: message.isSendByMe
              ? primaryColor
              : primaryColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
            bottomLeft: message.isSendByMe
                ? Radius.circular(30.r)
                : Radius.zero,
            bottomRight: message.isSendByMe
                ? Radius.zero
                : Radius.circular(30.r),
          ),
        ),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          child: Column(
            spacing: 5.h,
            crossAxisAlignment: message.isSendByMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                message.text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: message.isSendByMe
                      ? backgroundColor
                      : primaryColor.withValues(alpha: 0.6),
                ),
              ),
              Text(
                _formatTime(message.timeStamp),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10.sp,
                  color: message.isSendByMe
                      ? backgroundColor
                      : primaryColor.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }
}