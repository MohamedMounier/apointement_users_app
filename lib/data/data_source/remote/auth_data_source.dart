import 'package:appointment_users/core/network/error/firebase_error_model.dart';
import 'package:appointment_users/core/network/error/local_error_model.dart';
import 'package:appointment_users/core/utils/enums/app_enums.dart';
import 'package:appointment_users/data/models/requests/sign_in_request_model.dart';
import 'package:appointment_users/data/models/requests/sign_up_request_model.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/data/models/user_model.dart';
import 'package:appointment_users/di/di_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class AuthDataSource {
  Future<ResponseWrapper<UserModel>> signUp(SignUpRequestModel request);

  Future<ResponseWrapper<UserModel>> signIn(SignInRequestModel request);
  Future<ResponseWrapper<UserModel>> fetchUserByUid(String userId);

  Future<ResponseWrapper<void>> signOut();
}

@LazySingleton(as: AuthDataSource)
class FirebaseAuthDataSource implements AuthDataSource {
  @override
  Future<ResponseWrapper<UserModel>> signUp(SignUpRequestModel request) async {
    try {
      final userCredential = await diContainer<FirebaseAuth>()
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        return const ResponseWrapper.failure(
          LocalErrorModel(message: 'Failed to create user', code: 400),
        );
      }

      final userData = UserModel(
        uid: uid,
        email: request.email,
        userType: UserTypes.user,
        name: request.name,
        createdAt: Timestamp.now(),
      );

      await diContainer<FirebaseFirestore>()
          .collection('users')
          .doc(uid)
          .set(userData.toJson());

      return ResponseWrapper.success(userData);
    } on FirebaseAuthException catch (e) {
      return ResponseWrapper.failure(FirebaseErrorModel.fromCode(e.code));
    } catch (_) {
      return const ResponseWrapper.failure(
        LocalErrorModel(message: 'Unexpected error during signup', code: 500),
      );
    }
  }

  @override
  Future<ResponseWrapper<UserModel>> signIn(SignInRequestModel request) async {
    try {
      final userCredential = await diContainer<FirebaseAuth>()
          .signInWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );

      final uid = userCredential.user?.uid;
      if (uid == null) {
        return const ResponseWrapper.failure(
          LocalErrorModel(message: 'Failed to sign in', code: 400),
        );
      }

      final userDoc =
          await diContainer<FirebaseFirestore>()
              .collection('users')
              .doc(uid)
              .get();

      if (!userDoc.exists) {
        return const ResponseWrapper.failure(
          LocalErrorModel(message: 'User not found', code: 404),
        );
      }

      final user = UserModel.fromJson(userDoc.data()!..['uid'] = uid);
      return ResponseWrapper.success(user);
    } on FirebaseAuthException catch (e) {
      return ResponseWrapper.failure(FirebaseErrorModel.fromCode(e.code));
    } catch (_) {
      return const ResponseWrapper.failure(
        LocalErrorModel(message: 'Unexpected error during signin', code: 500),
      );
    }
  }
  @override
  Future<ResponseWrapper<UserModel>> fetchUserByUid(String userId) async {
    try {


      final userDoc =
      await diContainer<FirebaseFirestore>()
          .collection('users')
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        return const ResponseWrapper.failure(
          LocalErrorModel(message: 'User not found', code: 404),
        );
      }

      final user = UserModel.fromJson(userDoc.data()!..['uid'] = userId);
      return ResponseWrapper.success(user);
    } on FirebaseException catch (e) {
      return ResponseWrapper.failure(FirebaseErrorModel.fromCode(e.code));
    } catch (_) {
      rethrow;
      return const ResponseWrapper.failure(
        LocalErrorModel(message: 'Unexpected error during Fetching User', code: 500),
      );
    }
  }

  @override
  Future<ResponseWrapper<void>> signOut() async {
    try {
       await diContainer<FirebaseAuth>().signOut();
      return ResponseWrapper.success(null);
    } on FirebaseAuthException catch (e) {
      return ResponseWrapper.failure(FirebaseErrorModel.fromCode(e.code));
    } catch (_) {
      return const ResponseWrapper.failure(
        LocalErrorModel(message: 'Unexpected error during signin', code: 500),
      );
    }
  }
}
