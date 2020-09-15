import 'package:do_it_better/models/category.dart';
import 'package:do_it_better/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  // Create data
  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }
}