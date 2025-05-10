import 'package:appointment_users/core/network/error/firebase_error_model.dart';
import 'package:appointment_users/core/network/error/local_error_model.dart';
import 'package:appointment_users/core/network/paginated_response.dart';
import 'package:appointment_users/data/data_source/remote/const_collections.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/data/models/specialist_model.dart';
import 'package:appointment_users/data/models/specialization_category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

abstract class SpecialistsDataSource {
  Future<ResponseWrapper<PaginatedResponse<SpecialistModel>>> fetchSpecialistsByCategory(
      {
        required String categoryName,
        DocumentSnapshot? startAfter,
      }
  );

  // Future<ResponseWrapper<PaginatedResponse<SpecialistModel>>> fetchNextSpecialistsByCategory(
  //     {
  //       required String categoryName,
  //       DocumentSnapshot? startAfter,
  //     }
  // );

  Future<ResponseWrapper<List<SpecializationCategoryModel>>>
  fetchAllSpecializationsCategories();
  // Future<ResponseWrapper<SpecialistModel>> fetchSpecialistsByCategory(String categoryName);
}
@LazySingleton(as: SpecialistsDataSource)
class SpecialistsDataSourceImpl implements SpecialistsDataSource {
  final FirebaseFirestore _firestore;

  SpecialistsDataSourceImpl(this._firestore);

  @override
  Future<ResponseWrapper<PaginatedResponse<SpecialistModel>>> fetchSpecialistsByCategory({
    required String categoryName,
    DocumentSnapshot? startAfter,
  }) async {
    try {
      Query query = _firestore
          .collection(ConstFirebaseData.specialistsCollection)
          .where(ConstFirebaseData.category, isEqualTo: categoryName)
          .orderBy(ConstFirebaseData.createdAt, descending: true)
          .limit(ConstFirebaseData.itemsCountPerPage);

      if (startAfter != null) {
        query = query.startAfterDocument(startAfter);
      }

      final snapshot = await query.get();
      debugPrint('snapshot length: ${snapshot.docs.length}');

      final specialists = snapshot.docs
          .map((doc) => SpecialistModel.fromJson(doc.data() as Map<String,dynamic>))
          .toList();

      return ResponseWrapper.success(
        PaginatedResponse(data: specialists, lastDoc: snapshot.docs.isNotEmpty ? snapshot.docs.last : null),
      );
    } on FirebaseException catch (exception) {
      return ResponseWrapper.failure(
        FirebaseErrorModel(message: exception.message ?? ''),
      );
    } catch (e) {
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }

  @override
  Future<ResponseWrapper<List<SpecializationCategoryModel>>> fetchAllSpecializationsCategories() async {
    try {
      final snapshot =
      await _firestore.collection(ConstFirebaseData.specializationCollection).get();

      if (snapshot.docs.isEmpty) {
        return const ResponseWrapper.failure(
          FirebaseErrorModel(message: 'No specialization categories found'),
        );
      }

      final categories = snapshot.docs
          .map((doc) => SpecializationCategoryModel.fromJson(doc.data()))
          .toList();
      return ResponseWrapper.success(categories);
    } catch (e) {
      return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
    }
  }
}


// @LazySingleton(as: SpecialistsDataSource)
// class SpecialistsDataSourceImpl implements SpecialistsDataSource {
//   final FirebaseFirestore _firestore;
//
//   SpecialistsDataSourceImpl(this._firestore);
//
//   @override
//   Future<ResponseWrapper<List<SpecialistModel>>> fetchSpecialistsByCategory(
//     String categoryName,
//   ) async {
//     try {
//       final snapshot =
//           await _firestore
//               .collection(ConstFirebaseData.specialistsCollection)
//               .where(ConstFirebaseData.category, isEqualTo: categoryName)
//               .orderBy(ConstFirebaseData.createdAt, descending: true)
//               .limit(ConstFirebaseData.itemsCountPerPage)
//               .get();
//
//       if (snapshot.docs.isEmpty) {
//         return const ResponseWrapper.success([]);
//       }
//
//       final specialists =
//           snapshot.docs
//               .map((doc) => SpecialistModel.fromJson(doc.data()))
//               .toList();
//       return ResponseWrapper.success(specialists);
//     } on FirebaseException catch (exception) {
//       return ResponseWrapper.failure(
//         FirebaseErrorModel(message: exception.message ?? ''),
//       );
//     } catch (e) {
//       return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<ResponseWrapper<List<SpecialistModel>>> fetchNextSpecialistsByCategory(
//     String categoryName,
//     DocumentSnapshot lastDoc,
//   ) async {
//     try {
//       final snapshot =
//           await _firestore
//               .collection(ConstFirebaseData.specialistsCollection)
//               .where(ConstFirebaseData.category, isEqualTo: categoryName)
//               .orderBy(ConstFirebaseData.createdAt, descending: true)
//               .limit(ConstFirebaseData.itemsCountPerPage)
//               .startAfterDocument(lastDoc)
//               .limit(ConstFirebaseData.itemsCountPerPage)
//               .get();
//
//       if (snapshot.docs.isEmpty) {
//         return const ResponseWrapper.success([]);
//       }
//
//       final specialists =
//           snapshot.docs
//               .map((doc) => SpecialistModel.fromJson(doc.data()))
//               .toList();
//       return ResponseWrapper.success(specialists);
//     } on FirebaseException catch (exception) {
//       return ResponseWrapper.failure(
//         FirebaseErrorModel(message: exception.message ?? ''),
//       );
//     } catch (e) {
//       return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<ResponseWrapper<List<SpecializationCategoryModel>>>
//   fetchAllSpecializationsCategories() async {
//     try {
//       final snapshot =
//           await _firestore
//               .collection(ConstFirebaseData.specializationCollection)
//               .get();
//
//       if (snapshot.docs.isEmpty) {
//         return const ResponseWrapper.failure(
//           FirebaseErrorModel(message: 'No specialization categories found'),
//         );
//       }
//
//       final categories =
//           snapshot.docs
//               .map((doc) => SpecializationCategoryModel.fromJson(doc.data()))
//               .toList();
//       return ResponseWrapper.success(categories);
//     } catch (e) {
//       return ResponseWrapper.failure(LocalErrorModel(message: e.toString()));
//     }
//   }
// }
