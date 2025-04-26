
import 'package:isar/isar.dart';

part 'note.g.dart';

@collection
class  INote {
  INote(this.title, this.content);


  Id id = Isar.autoIncrement;
  String? title;
  String? content;
}