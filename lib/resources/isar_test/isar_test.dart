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
          Routemaster.of(context).push('/add-note-screen');
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Expanded(
                  child: StreamBuilder(
                      stream: isarService.grabNotes(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final notes = snapshot.data!;
                          if (notes.isEmpty) {
                            return Center(
                              child: Text('No note found'),
                            );
                          }
                          return GridView.builder(
                            
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final note = notes[index];

                                return Card(
                                  child: ListTile(
                                    title: Text(note.title!),
                                    // subtitle: Text(book.author.firstName),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: Text('Looking for notes'),
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
