import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'entities/notes/note.dart';


// dont know what to do with the below line. 

// final isarServiceProvider = Provider((ref){
//     // return Isarser();
// });


abstract class XIsarService {
  Future saveNote(INote newNote) async {}

  Future getAllNotes() async {}

  Future updateNote(INote newNote) async {}

  Future deleteNote(int noteId) async {}

  Future filterNote(String title, String content) async {}
}

class NoteApi implements XIsarService {
  final Isar _db;

  NoteApi({required Isar db}) : _db = db;

  @override
  Future deleteNote(int noteId) async {
    final isar = await _db;
    isar.writeTxn(() => isar.iNotes.delete(noteId));
  }

  @override
  Future getAllNotes() async {
    final isar = await _db;
    return await isar.iNotes.where().findAll();
  }

  @override
  Future saveNote(INote newNote) async {
    final isar = await _db;
    isar.writeTxnSync(()=> isar.iNotes.putSync(newNote));
  }

  @override
  Future updateNote(INote newNote) async {
    final isar = await _db;
    isar.writeTxn(() async {       
       isar.iNotes.put(newNote);
    });
  }

  @override
  Future filterNote(String title, String content) async {
    final isar = await _db;

    final queryResults = await isar.iNotes
        .filter()
        .titleContains(title)
        .contentContains(content)
        .findFirst();

    return queryResults;
  }
}

//! What to do with this snippet

Future<Isar> openDB() async {
  
  var dir = await getApplicationDocumentsDirectory();

  if (Isar.instanceNames.isEmpty) {
    return await Isar.open([], directory: dir.path, name: 'Notes instance');
  }

  return Future.value(Isar.getInstance());
}
