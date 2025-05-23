import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:xiphone/App/Providers/providers.dart';
import 'package:xiphone/database/entities/book_category/book_category.dart';

import '../../database/entities/book/book.dart';

class AddBookScreen extends ConsumerStatefulWidget {
  const AddBookScreen({super.key});

  @override
  ConsumerState<AddBookScreen> createState() => _AddBookState();
}

class _AddBookState extends ConsumerState<AddBookScreen> {
  late TextEditingController nameController;

  // BookCategory selectedBookCategory;

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
                  Routemaster.of(context).push('/add-author-screen');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.add), Text('Go to author')],
                )),
            ElevatedButton(
                onPressed: () {
                  Routemaster.of(context).push('/add-category-screen');
                 
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.add), Text('Go to Category')],
                )),
            ElevatedButton(
                onPressed: () {
                  // final  book = Book()


                  // ..title= ''
                  // ..bookCategory = 
                  // ..author= '';
                  // isarService.createBook(book);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.add), Text('Add book')],
                )),
            ElevatedButton(
                onPressed: () {
                  Routemaster.of(context).push('/theme-settings');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(Icons.add), Text('Change App theme')],
                )),
            
          ],
        ),
      ),
    );
  }
}
