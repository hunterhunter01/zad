import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/features/quran/data_source/data/quran_data_source.dart';
import 'package:zad/features/quran/data_source/models/quran_model.dart';
import 'package:zad/features/quran/presentation/cubit/quran_states.dart';


class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitial());
  Future<void> getPage(int pageNumber) async {
    try {
      emit(QuranLoading());
      final ayahs = await QuranDataSource.getAyahsByPage(pageNumber);
      emit(QuranSuccess(ayahs: ayahs, currentPage: pageNumber));
    } catch (e) {
      emit(QuranIFailer(error: e.toString()));
    }
  }

// List<QuranModel> getAyahsForSurah(List<QuranModel> ayahs, int suhraNumber) {
//     return ayahs.where((ayah) => ayah.chapterId == suhraNumber).toList();
//   }

//   String extractAyahNumber(String verseKey) {
//     return verseKey.split(':').last;
//   }
  



  
  
}
