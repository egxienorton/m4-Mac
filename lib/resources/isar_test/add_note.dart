import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:xiphone/App/Providers/providers.dart';
import 'package:xiphone/database/entities/book_category/book_category.dart';
import 'package:xiphone/database/entities/notes/note.dart';

import '../../database/entities/book/book.dart';

class AddNoteScreen extends ConsumerStatefulWidget {
  const AddNoteScreen({super.key});

  @override
  ConsumerState<AddNoteScreen> createState() => _AddNoteState();
}

class _AddNoteState extends ConsumerState<AddNoteScreen> {
  late TextEditingController nameController;

  // NoteCategory selectedNoteCategory;

  @override
  void initState() {
    // TODO: implement initState

    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isarService = ref.watch(isarServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a book !'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  // border: InputBorder(borderSide: BorderSide(width: 1))
                  ),
            ),
            Spacer(),
            
            ElevatedButton(
                onPressed: () {

                  final note = INote('Hi From egxie', 'Yo! man we the best');

                  isarService.createNote(note);
                  // final  book = Note()


                  // ..title= ''
                  // ..bookCategory = 
                  // ..author= '';
                  // isarService.createNote(book);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.add), Text('Add note')],
                )),
            
          ],
        ),
      ),
    );
  }
}
