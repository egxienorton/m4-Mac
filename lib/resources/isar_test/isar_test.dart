import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:xiphone/App/Providers/providers.dart';

class IsarTest extends ConsumerWidget {
  const IsarTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isarService = ref.watch(isarServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Isar test'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('navigating to screen');
          Routemaster.of(context).push('/add-book-screen');
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: StreamBuilder(
                      stream: isarService.getAllBooks(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final books = snapshot.data!;
                          if (books.isEmpty) {
                            return Center(
                              child: Text('No books found'),
                            );
                          }
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final book = books[index];

                                return Card(
                                  child: ListTile(
                                    title: Text(book.title),
                                    // subtitle: Text(book.author.firstName),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: Text('No books found'),
                          );
                        }
                      })),
            )
          ],
        ),
      ),
    );
  }
}
