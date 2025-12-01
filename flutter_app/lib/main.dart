import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:messaging_app/services/hive_services.dart';
import 'package:messaging_app/utils/providers.dart';
import 'package:messaging_app/utils/theme.dart';
import 'package:messaging_app/views/home_view.dart';

import 'package:provider/provider.dart';

import 'models/message.dart';

void main() async{

WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MessageAdapter());



  await Hive.openBox<Message>(HiveService.boxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: ProviderTree().get(context),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.lightTheme,

              home: HomeScreenView()
          ),
        );
      },
    );
  }
}

