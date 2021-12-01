import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiv2/screens/dashboard.dart';
import 'package:uiv2/screens/order.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    // await windowManager.setAsFrameless();
    await windowManager.setPosition(const Offset(200, 100));
    await windowManager.setMinimumSize(const Size(1500, 800));
    windowManager.show();
  });
  runApp(
    const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: DashboardScreen(),
      ),
    ),
  );
}
