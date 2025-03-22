import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:itbeesolutionstest/service/work_manager_service.dart';
import 'config/app_bloc_observer.dart';
import 'go_router/go_router.dart';
import 'service/notification_service.dart';
import 'package:worker_manager/worker_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await NotificationService.init();
  workerManager.log = true;
  await workerManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}