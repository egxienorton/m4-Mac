import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xiphone/database/entities/author/author.dart';
import 'package:xiphone/database/entities/book/book.dart';
import 'package:xiphone/database/entities/book_category/book_category.dart';


class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [BookSchema, AuthorSchema, BookCategorySchema],
        // inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
  // Adding a book
  Future<void> createBook (Book newBook) async {
    final isar = await db;
    isar.writeTxnSync<int>(()=> isar.books.putSync(newBook));
  }

  // adding a category
  Future<void> createBookCategory(BookCategory bookCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(()=> isar.bookCategorys.putSync(bookCategory));
  }


  // Powerful stream apis.
  Stream<List<BookCategory>> getAllBookCategories () async* {
    final isar = await db;
    yield* isar.bookCategorys.where().watch(fireImmediately: true);
  }
  Stream<List<Book>> getAllBooks () async* {
    final isar = await db;
    yield* isar.books.where().watch(fireImmediately: true);
  }
  Stream<List<Author>> getAllAuthors () async* {
    final isar = await db;
    yield* isar.authors.where().watch(fireImmediately: true);
  }


  // Ckear
  Future<void> cleanDB() async {
    final isar = await db;
    await isar.writeTxn(()=> isar.clear());
  }
}
