import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/data/data/azkar_data_source.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_cubit.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ZikrScreen extends StatelessWidget {
  final String category;
  final String title;
  const ZikrScreen({super.key, required this.category, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: GoogleFonts.amiri(
                fontSize: 24,
                fontWeight: .w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff1B5E40),
      ),
      body: BlocProvider(
        create: (context) => AzkarCubit()..getazkar(category),
        child: BlocBuilder<AzkarCubit, AzkarStates>(
          builder: (context, state) {
            if (state is AzkarLoading) {
              return Align(
                alignment: .center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is AzkarFailer) {
              return Text(state.error);
            }
            if (state is AzkarSuccess) {
              return ListView.separated(
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      state.azkarList[index].text,
                      textAlign: .right,
                      style: GoogleFonts.openSans(
                        color: Color(0xff1C1917),
                        fontSize: 20,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: state.azkarList.length,
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
