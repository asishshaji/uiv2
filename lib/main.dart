import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiv2/screens/dashboard.dart';
// import 'package:window_manager/window_manager.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await windowManager.ensureInitialized();

  // windowManager.waitUntilReadyToShow().then((_) async {
  //   windowManager.show();
  //   await windowManager.setFullScreen(true);
  // });
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
