import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/chat_provider.dart';
import '../utils/color.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [

        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Expanded(
              child: TextField(
                onTap: () {
                  if (focusNode.hasFocus) {
                    print(".............................");
                    Provider.of<ChatProvider>(context, listen: false).markAllAsRead();
                  }
                },
                focusNode: focusNode,
                controller: controller,
                onSubmitted: (value) {
                  if (controller.text.trim().isEmpty) return;

                  Provider.of<ChatProvider>(
                    context,
                    listen: false,
                  ).sendMessage(controller.text.trim());
                  controller.clear();
                },

                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Type your message here..",
                  hintStyle: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: hintColor2),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (controller.text.trim().isEmpty) return;

            Provider.of<ChatProvider>(
              context,
              listen: false,
            ).sendMessage(controller.text.trim());
            controller.clear();
          },
          child: CircleAvatar(
            radius: 20.r,
            backgroundColor: primaryColor,
            child: Icon(Icons.send, color: backgroundColor, size: 20.w),
          ),
        ),
      ],
    );
  }


}