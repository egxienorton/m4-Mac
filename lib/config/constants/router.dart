import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:xiphone/extras/artifacts/home.dart';
import 'package:xiphone/main.dart'; 
import 'route_constants.dart';
 
final loggedOutRoute = RouteMap(routes: {
  '/': (_) => MaterialPage(child: StudynautzLoginPage()),
  // '/': (_) => MaterialPage(child: Launcher()),
  // '/': (_) => const MaterialPage(child: StudynautzLoginScreen()),
});
final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => MaterialPage(child: StudynautzHomePage()),
    // '/': (_) => MaterialPage(child: StudynautzHomePage()),

     

    // AppRoute.chat.path: (_) => MaterialPage(child: ChatPage()),

     

    //* E-Learning pages

  },
);
