import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/features/asmaaAllah/data_source/data/asmaa_allah_data_source.dart';

import 'package:zad/features/asmaaAllah/presentation/cubit/asmaa_allah_states.dart';


class AsmaaAllahCubit extends Cubit<AsmaaAllahStates> {
  AsmaaAllahCubit() : super(AsmaaAllahInitial());
  Future<void> getNames() async {
    emit(AsmaaAllahLoading());
    try {
      final  names = await AsmaaAllahDataSource.getAllNames();
      emit(AsmaaAllahSuccess(namesList: names));
    } catch (e) {
      emit(AsmaaAllahFailer(error: e.toString()));
    }
  }
}
