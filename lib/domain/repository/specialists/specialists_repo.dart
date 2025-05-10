import 'package:appointment_users/core/network/paginated_response.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SpecialistsRepository {
  Future<ResponseWrapper<PaginatedResponse<SpecialistEntity>>> getSpecialists({
    required String categoryName,
    DocumentSnapshot? startAfter,
  });

  Future<ResponseWrapper<List<SpecializationCategoryEntity>>> getSpecializationCategories();
}
