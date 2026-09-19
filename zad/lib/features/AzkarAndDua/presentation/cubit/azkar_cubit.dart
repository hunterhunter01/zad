import 'package:bloc/bloc.dart';
import 'package:zad/features/AzkarAndDua/data_source/data/azkar_data_source.dart';

import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit() : super(AzkarInitial());
  Future<void> getazkar(String category) async {
    emit(AzkarLoading());
    try {
      final azkarList = await AzkarDataSource.getAzkarByCategory(category);
      emit(AzkarSuccess(azkarList: azkarList));
    } catch (e) {
      emit(AzkarFailer(error: e.toString()));
    }
  }

}
