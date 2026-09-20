import 'package:zad/features/quran/data_source/models/quran_model.dart';

sealed class QuranStates {}

class QuranInitial extends QuranStates {}

class QuranLoading extends QuranStates {}

class QuranIFailer extends QuranStates {
  final String error;

  QuranIFailer({required this.error});
}

class QuranSuccess extends QuranStates {
  final List<QuranModel> ayahs;
  final int currentPage;

  QuranSuccess({required this.ayahs, required this.currentPage});
}
