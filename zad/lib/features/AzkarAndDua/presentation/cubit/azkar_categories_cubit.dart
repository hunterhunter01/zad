import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/features/AzkarAndDua/data/data/azkar_categories_data_source.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_state.dart';

class AzkarCategoriesCubit extends Cubit<AzkarCategoriesState> {
  AzkarCategoriesCubit() : super(AzkarCategoriesInitial());
  Future<void> getcategories() async {
    emit(AzkarCategoriesLoading());
    try {
      final categories = await AzkarCategoriesDataSource.getAllCategories();
      emit(AzkarCategoriesSuccess(categories: categories));
    } catch (e) {
      emit(AzkarCategoriesFailer(error: e.toString()));
    }
  }
}
