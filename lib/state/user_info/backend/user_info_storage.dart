import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod_practice/state/constants/firebase_collection_name.dart';
import 'package:riverpod_practice/state/constants/firebase_field_name.dart';
import 'package:riverpod_practice/state/posts/typedefs/user_id.dart';
import 'package:riverpod_practice/state/user_info/models/user_info_payload.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo({
    required UserId userId,
    required String displayName,
    required String? email,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .where(FirebaseFieldName.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? '',
        });
        return true;
      } else {
        final payload = UserInfoPayload(
          userId: userId,
          displayName: displayName,
          email: email,
        );

        await FirebaseFirestore.instance
            .collection(FirebaseCollectionName.users)
            .add(payload);

        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
