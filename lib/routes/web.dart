import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:xiphone/resources/isar_test/add_book.dart';
import 'package:xiphone/resources/isar_test/isar_test.dart';
import 'package:xiphone/resources/views/quiz/home.dart';

/////////////----ROUTES----\\\\\\\\\\\\

final routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(
          routes: {
            '/': (_) => const MaterialPage(child: IsarTest()),
            '/quiz-screen': (_) => const MaterialPage(child: QuizScreen()),
            '/add-book-screen': (_) => const MaterialPage(child: AddBookScreen())
          },
          onUnknownRoute: (path) => const MaterialPage(
              child: Center(
            child: Text('Not found'),
          )),
        ));
