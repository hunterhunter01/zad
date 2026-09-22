import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zad/features/AzkarAndDua/data_source/data/azkar_categories_data_source.dart';

import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_state.dart';

class AzkarCategoriesCubit extends Cubit<AzkarCategoriesState> {
  AzkarCategoriesCubit() : super(AzkarCategoriesInitial());
  Future<void> getAzkarCategories() async {
    emit(AzkarCategoriesLoading());
    try {
      final categories = await AzkarCategoriesDataSource.getAllCategories();
      final azkarList = categories
          .where((e) => !e.title.contains('دعاء'))
          .toList();
      emit(AzkarCategoriesSuccess(categories: azkarList));
    } catch (e) {
      emit(AzkarCategoriesFailer(error: e.toString()));
    }
  }

  Future<void> getDuaCategories() async {
    emit(AzkarCategoriesLoading());
    try {
      final categories = await AzkarCategoriesDataSource.getAllCategories();

      final duaList = categories
          .where((category) => category.title.contains('دعاء'))
          .toList();

      emit(AzkarCategoriesSuccess(categories: duaList));
    } catch (e) {
      emit(AzkarCategoriesFailer(error: e.toString()));
    }
  }
}
