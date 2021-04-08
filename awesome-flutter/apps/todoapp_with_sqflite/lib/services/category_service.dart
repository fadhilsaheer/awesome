import 'package:todoapp_with_sqflite/models/category.dart';
import 'package:todoapp_with_sqflite/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }

  readCategory() async {
    return await _repository.readData('categories');
  }

  readCategoryById(int categoryId) async {
    return await _repository.readDataById('categories', categoryId);
  }

  updateCategory(Category category) async {
    return await _repository.updateData('categories', category.categoryMap());
  }

  deleteCategory(int categoryId) async {
    return await _repository.deleteData('categories', categoryId);
  }
}
