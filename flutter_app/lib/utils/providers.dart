
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/chat_provider.dart';


class ProviderTree {
  List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: ChatProvider()),




    ];
  }
}