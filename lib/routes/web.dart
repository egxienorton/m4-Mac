import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:xiphone/extras/artifacts/settings_home.dart';
import 'package:xiphone/resources/isar_test/add_author.dart';
import 'package:xiphone/resources/isar_test/add_book.dart';
import 'package:xiphone/resources/isar_test/add_category.dart';
import 'package:xiphone/resources/isar_test/add_note.dart';
import 'package:xiphone/resources/isar_test/isar_test.dart';
import 'package:xiphone/resources/views/quiz/home.dart';

/////////////----ROUTES----\\\\\\\\\\\\

final routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) => RouteMap(
          routes: {
            '/': (_) => const MaterialPage(child: SettingsHome()),
            '/settings': (_) => const MaterialPage(child: IsarTest()),
            '/quiz-screen': (_) => const MaterialPage(child: QuizScreen()),
            '/add-note-screen': (_) =>
                const MaterialPage(child: AddNoteScreen()),
            '/add-book-screen': (_) =>
                const MaterialPage(child: AddBookScreen()),
            '/add-author-screen': (_) => const MaterialPage(child: AddAuthor()),
            '/add-category-screen': (_) =>
                const MaterialPage(child: AddCategory())
          },
          onUnknownRoute: (path) => const MaterialPage(
              child: Center(
            child: Text('Not found'),
          )),
        ));
