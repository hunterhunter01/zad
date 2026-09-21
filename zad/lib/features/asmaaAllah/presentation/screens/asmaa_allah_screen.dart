import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_state.dart';
import 'package:zad/features/asmaaAllah/data_source/model/asmaa_allah_model.dart';
import 'package:zad/features/asmaaAllah/presentation/cubit/asmaa_allah_cubit.dart';
import 'package:zad/features/asmaaAllah/presentation/cubit/asmaa_allah_states.dart';
import 'package:zad/features/asmaaAllah/presentation/widgets/asmaa_allah_card.dart';


class AsmaaAllahScreen extends StatefulWidget {
 const AsmaaAllahScreen({super.key});

  @override
  State<AsmaaAllahScreen> createState() => _AsmaaAllahScreenState();
}

class _AsmaaAllahScreenState extends State<AsmaaAllahScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 50.h,
        actions: [
          Padding(
            padding:  EdgeInsets.all(10.0.r),
            child: Text(
              'أسماء الله الحسنى',
              style: GoogleFonts.amiri(
                fontSize: 24.sp,
                fontWeight: .w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff1B5E40),
      ),
      body: BlocProvider(
        create: (context) => AsmaaAllahCubit()..getNames(),
        child: BlocBuilder<AsmaaAllahCubit, AsmaaAllahStates>(
          builder: (context, state) {
            if (state is AsmaaAllahLoading) {
              return Align(
                alignment: .center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is AsmaaAllahFailer) {
              return Text(state.error);
            }
            if (state is AsmaaAllahSuccess) {
              return GridView.builder(
                padding: EdgeInsets.all(20.r),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                  childAspectRatio: 0.75,
                ),
                itemCount: state.namesList.length,
                itemBuilder: (context, index) {
                  final bool isSelected = selectedIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = isSelected ? -1 : index;
                      });
                    },
                    child: AsmaaAllahCard(isSelected: isSelected,model: AsmaaAllahModel(number: state.namesList[index].number, name: state.namesList[index].name, transliteration: state.namesList[index].transliteration, meaning: state.namesList[index].meaning),),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

