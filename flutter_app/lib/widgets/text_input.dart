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
    required this.showEmojiPicker,
    this.onTapTextField,
    required this.scrollController,
    this.onTapPrefixIcon,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool showEmojiPicker;
  final void Function()? onTapTextField;
  final ScrollController scrollController;
  final void Function()? onTapPrefixIcon;

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
            child: TextField(
              onTap: onTapTextField,
              focusNode: focusNode,
              controller: controller,
              scrollController: scrollController,
              maxLines: null,
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
                prefixIcon: InkWell(

                  onTap:onTapPrefixIcon ,
                  child: Icon(
                    showEmojiPicker? Icons.keyboard_alt_outlined :Icons.emoji_emotions_outlined,
                    color: primaryColor,
                    size: 20.w,
                  ),
                ),
                hintText: "Type your message here..",
                hintStyle: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: hintColor2),
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
