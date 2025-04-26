import 'package:appwrite/appwrite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/App/Repositories/auth_api.dart';
import 'package:xiphone/App/Http/api/user_api.dart';
import 'package:xiphone/extras/artifacts/home.dart';
import 'package:xiphone/bootstrap/utils/utils.dart';
import 'package:xiphone/features/auth/login/login.dart';
import 'package:xiphone/App/Models/user_model.dart';

// final authControllerProvider = StateNotifierProvider((ref) {

  
  // return AuthController(
  //     authAPI: ref.watch(authApiProvider), userAPI: ref.watch(userApiProvider));
// });

final userDetailsProvider = FutureProvider.family((ref, String uid) {
  // final authController = ref.watch(authControllerProvider.notifier);

  // return authController.getUserData(uid);
});


final currentUserAccountProvider = FutureProvider((ref){
  // final authController = ref.watch(authControllerProvider.notifier);

  // return authController.currentUser();
});


//oooh - we forgot these lines below.. (dont think there is a .family)
final currentUserDetailsProvider = FutureProvider.family((ref, String uid) {

  
  final currentUserId = ref.watch(currentUserAccountProvider).value;

  // final userDetails = ref.watch(userDetailsProvider(currentUserId));

  // return value;
});

// class AuthController extends StateNotifier<bool> {
//   final AuthAPI _authAPI;
//   final UserAPI _userAPI;

//   AuthController({required AuthAPI authAPI, required UserAPI userAPI})
//       : _authAPI = authAPI,
//         _userAPI = userAPI,
//         super(false);

//   Future<Account?> currentUser() => _authAPI.currentUserAccount();

//   void signup(
//       {required BuildContext context,
//       required String email,
//       required String password}) async {
//     state = true;

//     final response = await _authAPI.signup(email: email, password: password);
//     //! omo l.message and r.$id are wicked codes
//     response.fold((l) => showSnackbar(context, l.message), (r) async {
//       UserModel userModel = UserModel(email: email, uid: r.$id);
//       final response2 = await _userAPI.saveUserData(userModel);

//       response2.fold((l) => showSnackbar(context, l.message), (r) {
//         showSnackbar(context, 'Account created! You can now login.');

//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => StudynautzHomePage()));
//       });
//     });
//   }

//   void login(
//       {required BuildContext context,
//       required String email,
//       required String password}) async {
//     state = true;

//     final response = await _authAPI.login(email: email, password: password);
//     state = false;
//     //! omo l.message and r.$id are wicked codes
//     response.fold((l) => showSnackbar(context, l.message), (r) async {});
//   }

//   void logout(BuildContext ctx) async {
//     final response = await _authAPI.logout();

//     response.fold(
//         (l) => null,
//         (r) => Navigator.push(
//             ctx, MaterialPageRoute(builder: (ctx) => LoginScreen())));
//   }

//   Future<UserModel> getUserData(String uid) async {
//     final document = await _userAPI.getUserData(uid);

//     final updatedUser = UserModel.fromMap(document.data);

//     return updatedUser;
//   }
// }
