import 'package:appointment_users/data/models/response_models/response_wrapper.dart';
import 'package:appointment_users/domain/entities/specialization_category_entity.dart';
import 'package:appointment_users/domain/repository/specialists/specialists_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetSpecializationCategoriesUseCase {
  final SpecialistsRepository _repo;

  GetSpecializationCategoriesUseCase(this._repo);

  Future<ResponseWrapper<List<SpecializationCategoryEntity>>> call() {
    return _repo.getSpecializationCategories();
  }
}
