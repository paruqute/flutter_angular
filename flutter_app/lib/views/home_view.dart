import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/chat_provider.dart';
import '../utils/color.dart';
import 'dashboard.dart';
import 'message_view.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _selectedIndex = 0;

  List screens = [DashboardView(), MessagingView()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = context.watch<ChatProvider>().unreadCount;
    return Scaffold(

      body: screens.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: scaffoldBgColor,
        backgroundColor: primaryColor,
        unselectedItemColor: hintColor2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.chat_bubble),

                if(count > 0) Positioned(
                  right: 0,
                    top: 0,
                  child: CircleAvatar(
                    radius: 8.r,
                    backgroundColor: secondaryColor,
                    child: Text(count.toString(),style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 10,color: backgroundColor),),
                  ),),
              ],
            ),
            label: "Message",
          ),

        ],
      ),
    );
  }
}
