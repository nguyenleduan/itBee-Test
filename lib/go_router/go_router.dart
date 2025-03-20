
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/welcome/welcome_screen.dart';
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      name: 'TaskScreen',
      path: '/TaskScreen',
      builder: (context, state) => const HomeScreen(),
    ),
//     GoRoute(name: 'LoginScreen', path: '/LoginScreen', builder: (context, state){
//       DataSetting.contextHome = context;
//       DataSetting.timer?.cancel();
//       return const LoginScreen();
//     }, routes: [
//       GoRoute(
//         name: 'OTPFirstScreen',
//         path: 'OTPFirstScreen',
//         builder: (context, state) => OTPScreen(TypeOTP.firstLogin),
//       )
//   ],
// )
 ]
);
