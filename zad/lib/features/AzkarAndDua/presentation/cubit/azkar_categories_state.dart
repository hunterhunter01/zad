
import 'package:zad/features/AzkarAndDua/data_source/models/azkar_categories_model.dart';

sealed class AzkarCategoriesState {}

class AzkarCategoriesLoading extends AzkarCategoriesState {}

class AzkarCategoriesInitial extends AzkarCategoriesState {}

class AzkarCategoriesSuccess extends AzkarCategoriesState {
  final List<AzkarCategoryModel> categories;

  AzkarCategoriesSuccess({required this.categories});
}

class AzkarCategoriesFailer extends AzkarCategoriesState {
  final String error;
  AzkarCategoriesFailer({required this.error});
}

