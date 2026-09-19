

import 'package:zad/features/quran/data/models/suhras_model.dart';


sealed class SuhrasStates {}

class SuhrasInitial extends SuhrasStates {}

class SuhrasLoading extends SuhrasStates {}

class SuhrasSuccess extends SuhrasStates {
  final List<SuhrasModel> suhrasList;

  SuhrasSuccess({required this.suhrasList});
}

class SuhrasFailer extends SuhrasStates {
  final String error;

  SuhrasFailer({required this.error});
}
