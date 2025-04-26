
// import 'package:appwrite/appwrite.dart';
// import 'package:appwrite/models.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:xiphone/config/providers/providers.dart';
// import 'package:xiphone/config/utils/handlers/failure.dart';

// final authApiProvider = Provider((ref){
//   return AuthAPI(account: ref.watch(appwriteAccountProvider));
// });

// abstract class IAuthAPI {
// //   FutureEither<Account> signup({required String email, required String password});
//   FutureEither<Account> signup({required String email, required String password});


//   FutureEither<Session>login({required String email, required String password}); 

//   //TODO: Verify generics for this method.
//   FutureEither<Account?> currentUserAccount();

//   FutureEitherVoid logout();
// }

// class AuthAPI implements IAuthAPI {
//   final Account _account;

//   AuthAPI({required Account account}) : _account = account;
//   @override
//   // Previous generic return type as Account not user but it wasn't found as the return type to the _account method.
//   // Future<Account?> currentUserAccount() async {
//   FutureEither<Account?> currentUserAccount() async {
//      try {
//       return right(await _account.get());
//      } on AppwriteException catch(e, st){
//       return null;
//      } 
     
//      catch(e, st) {
//           return left(Failure(e.toString(), st));
//      }
//   }

//   @override
//   FutureEither<Session> login({required String email, required String password}) async {
//    try {
//     final session = await _account.createEmailPasswordSession(email: email, password: password);

//     return right(session);
//    } catch(e, st){
//     return left(Failure(e.toString(), st));
//    }
//   }

//   @override
//   logout() async {
//     try{
//       await _account.deleteSession(sessionId: 'current');

//       return right(null);
//     } catch(e, st){
//       return left(Failure(e.toString(), st));
//     }
//   }

//   @override
//   //! These guys ain't got no type
//   signup({required String email, required String password}) async {
//     try {
//       final account = await _account.create(userId: ID.unique(), email: email, password: password);

//       return right(account);
//     } on AppwriteException catch(e, st){
//       return left(Failure(e.toString(), st ));
//     } 
    
//     catch(e, st){
//       return left(Failure(e.toString(), st));
//     }
//   }

// }


