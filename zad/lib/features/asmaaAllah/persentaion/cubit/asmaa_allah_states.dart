import 'package:zad/features/asmaaAllah/data/model/asmaa_Allah_model.dart';

sealed class AsmaaAllahStates {}

class AsmaaAllahInitial extends AsmaaAllahStates {}

class AsmaaAllahLoading extends AsmaaAllahStates {}

class AsmaaAllahSuccess extends AsmaaAllahStates {
  final List<AsmaaAllahModel> namesList;

  AsmaaAllahSuccess({required this.namesList});
}

class AsmaaAllahFailer extends AsmaaAllahStates {
  final String error;

  AsmaaAllahFailer({required this.error});
}
