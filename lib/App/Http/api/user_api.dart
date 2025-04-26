// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:xiphone/constants/appwrite_constants.dart';
// import 'package:xiphone/core/providers/providers.dart';
// import 'package:xiphone/core/utils/handlers/failure.dart';
// import 'package:xiphone/models/user_model.dart';

// import '../core/utils/handlers/type_defs.dart';

// final userApiProvider = Provider((ref) {
//   return UserAPI(db: ref.watch(appwriteDatabaseProvider));
// });

// abstract class IUserAPI {
//   FutureEitherVoid saveUserData(UserModel userModel) {}

//   //! was formely Future<Document> -- check your type_defs
//   FutureEither<Document> getUserData(String uid) {}
// }

// class UserAPI implements IUserAPI {
//   final Databases _db;

//   UserAPI({required Databases db}) : _db = db;

//   @override
//   Future<Document> getUserData(String uid) async {
//     return await _db.getDocument(
//         databaseId: AppwriteConstants.databaseId,
//         collectionId: AppwriteConstants.usersCollection,
//         documentId: uid);
//   }

//   @override
//   FutureEitherVoid saveUserData(UserModel userModel) async {
//     try {
//       await _db.createDocument(
//           databaseId: AppwriteConstants.databaseId,
//           collectionId: AppwriteConstants.usersCollection,
//           documentId: userModel.uid,
//           data: userModel.toMap());

//       return right(null);
//     } on AppwriteException catch (e, st) {
//       return left(Failure(e.toString(), st));
//     } catch (e, st) {
//       return left(Failure(e.toString(), st));
//     }
//   }
// }
