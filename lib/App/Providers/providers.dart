import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xiphone/config/constants/appwrite_constants.dart';

import '../../bootstrap/services/isar_service.dart';

final isarServiceProvider = Provider((ref){
  return IsarService();
});





//////////////////////////----APPWRITE-----\\\\\\\\\\\\\\\\\\\\\\\\\\\
final appwriteClientProvider = Provider((ref) {
  Client client = Client();

  return client
      .setEndpoint(AppwriteConstants.endPoint)
      .setProject(AppwriteConstants.projectId)
      .setSelfSigned(status: true);

  // setEndPointRealtime(endPoint)
});

final appwriteAccountProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);

  return Account(client);
});


final appwriteDatabaseProvider = Provider((ref){
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
});

