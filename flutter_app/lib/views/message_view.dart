
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:messaging_app/utils/color.dart';
import 'package:provider/provider.dart';

import '../models/message.dart';
import '../provider/chat_provider.dart';
import '../widgets/chat_group_header.dart';
import '../widgets/message_bubble.dart';
import '../widgets/text_input.dart';

class MessagingView extends StatefulWidget {
  const MessagingView({super.key});

  @override
  State<MessagingView> createState() => _MessagingViewState();
}

class _MessagingViewState extends State<MessagingView> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  bool showEmojiPicker = false;

  @override
  void initState() {
    _controller = TextEditingController();
    _focusNode = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// when the textfield focus mark all messages as read
      _focusNode.addListener(onFocusChange);

      Provider.of<ChatProvider>(context, listen: false).loadMessages();
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void onFocusChange() {
    if (_focusNode.hasFocus) {
      print(".............................");
      Provider.of<ChatProvider>(context, listen: false).markAllAsRead();
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, value, child) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) => _scrollToBottom(),
        );
        return Scaffold(
          appBar: AppBar(title: Text("Ask Me!")),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: GroupedListView<Message, DateTime>(
                    controller: _scrollController,
                    padding: EdgeInsets.all(15.w),
                    order: GroupedListOrder.DESC,
                    floatingHeader: true,
                    useStickyGroupSeparators: true,
                    reverse: true,
                    elements: value.messageLists,
                    groupBy: (message) => DateTime(
                      message.timeStamp.year,
                      message.timeStamp.month,
                      message.timeStamp.day,
                    ),
                    // padding: EdgeInsets.all(8.w),
                    groupHeaderBuilder: (Message message) =>
                        ChatGroupHeader(message: message),
                    itemBuilder: (context, element) =>
                        MessageBubble(message: element),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextInputWidget(
                    controller: _controller,
                    focusNode: _focusNode,
                    showEmojiPicker: showEmojiPicker,
                      onTapTextField: () {
                        if (_focusNode.hasFocus) {
                          print(".............................");
                          Provider.of<ChatProvider>(context, listen: false).markAllAsRead();
                          if(showEmojiPicker==true){
                            setState(() {
                              showEmojiPicker = false;
                            });
                          }
                        }
                      },
                    scrollController: _scrollController2,
                    onTapPrefixIcon: () {
                      setState(() {
                        showEmojiPicker = !showEmojiPicker;
                      });
                      if(showEmojiPicker){
                        FocusScope.of(context).unfocus();
                      }else{
                        FocusScope.of(context).requestFocus();
                      }
                    },

                  ),
                ),
                Offstage(
                  offstage: !showEmojiPicker,
                  child: EmojiPicker(
                    textEditingController: _controller,
                    config:  Config(
                      height: 256,
                      searchViewConfig: SearchViewConfig(),
                        categoryViewConfig: CategoryViewConfig(
                          indicatorColor: primaryColor,
                          backgroundColor: primaryColor.withValues(alpha: 0.1),
                          dividerColor: primaryColor.withValues(alpha: 0.2),
                          iconColorSelected: primaryColor,
                        ),
                      emojiViewConfig: EmojiViewConfig(
                        backgroundColor: primaryColor.withValues(alpha: 0.1)


                      ),
                        bottomActionBarConfig: const BottomActionBarConfig(
                          showSearchViewButton: false,
                          showBackspaceButton: false,
                        ),


                    ),
                  ),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}
