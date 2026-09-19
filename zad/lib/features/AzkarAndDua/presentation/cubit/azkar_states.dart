import 'package:zad/features/AzkarAndDua/data/models/azkar_model.dart';

sealed class AzkarStates {}

class AzkarLoading extends AzkarStates {}

class AzkarInitial extends AzkarStates {}

class AzkarSuccess extends AzkarStates {
  final List<AzkarModel> azkarList;

  AzkarSuccess({required this.azkarList});
}

class AzkarFailer extends AzkarStates {
  final String error;
  AzkarFailer({required this.error});
}
