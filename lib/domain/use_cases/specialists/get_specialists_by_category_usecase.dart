import 'package:appointment_users/core/network/paginated_response.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/domain/repository/specialists/specialists_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSpecialistsByCategoryUseCase {
  final SpecialistsRepository _repo;

  GetSpecialistsByCategoryUseCase(this._repo);

  Future<ResponseWrapper<PaginatedResponse<SpecialistEntity>>> call({
    required String categoryName,
    DocumentSnapshot? startAfter,
  }) {
    return _repo.getSpecialists(
      categoryName: categoryName,
      startAfter: startAfter,
    );
  }
}
