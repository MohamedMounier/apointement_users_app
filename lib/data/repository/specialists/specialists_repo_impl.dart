import 'package:appointment_users/core/network/paginated_response.dart';
import 'package:appointment_users/data/data_source/remote/specialists_data_source.dart';
import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/specialist_entity.dart';
import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:appointment_users/domain/repository/specialists/specialists_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SpecialistsRepository)
class SpecialistsRepositoryImpl implements SpecialistsRepository {
  final SpecialistsDataSource _dataSource;

  SpecialistsRepositoryImpl(this._dataSource);

  @override
  Future<ResponseWrapper<PaginatedResponse<SpecialistEntity>>> getSpecialists({
    required String categoryName,
    DocumentSnapshot? startAfter,
  }) async {
    final response = await _dataSource.fetchSpecialistsByCategory(
      categoryName: categoryName,
      startAfter: startAfter,
    );

    return response.when(
      success: (paginated) {
        final entities =
            paginated.data.map((model) => model.toEntity()).toList();

        return ResponseWrapper.success(
          PaginatedResponse(data: entities, lastDoc: paginated.lastDoc),
        );
      },
      failure: (error) {
        return ResponseWrapper.failure(error);
      },
    );
  }

  @override
  Future<ResponseWrapper<List<SpecializationCategoryEntity>>>
  getSpecializationCategories() async {
    final response = await _dataSource.fetchAllSpecializationsCategories();

    return response.when(
      success: (data) {
        final entities = data.map((model) => model.toEntity()).toList();

        return ResponseWrapper.success(entities);
      },
      failure: (error) {
        return ResponseWrapper.failure(error);
      },
    );
  }
}
