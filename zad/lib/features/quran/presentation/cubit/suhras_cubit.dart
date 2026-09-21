import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/features/quran/data_source/data/suhras_data_source.dart';
import 'package:zad/features/quran/presentation/cubit/suhras_states.dart';




class SuhrasCubit extends Cubit<SuhrasStates> {
  SuhrasCubit() : super(SuhrasInitial());

  Future<void> getSuhras() async {
    try {
      emit(SuhrasLoading());
      final suhras = await SuhrasDataSource.getSuhras();
      emit(SuhrasSuccess(suhrasList: suhras));
    } catch (e) {
      emit(SuhrasFailer(error: e.toString()));
    }
  }
}
