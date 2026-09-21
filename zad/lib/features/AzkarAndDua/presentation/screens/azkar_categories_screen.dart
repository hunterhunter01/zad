import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zad/features/AzkarAndDua/data_source/models/azkar_categories_model.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_cubit.dart';
import 'package:zad/features/AzkarAndDua/presentation/cubit/azkar_categories_state.dart';
import 'package:zad/features/AzkarAndDua/presentation/screens/zikr_screen.dart';
import 'package:zad/features/AzkarAndDua/presentation/widgets/azkar_and_dua_category_card.dart';

class AzkarCategoriesScreen extends StatelessWidget {
  const AzkarCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8F3),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Text(
              'الأذكار',
              style: GoogleFonts.amiri(
                fontSize: 22.sp,
                fontWeight: .w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Color(0xff1B5E40),
      ),
      body: BlocProvider(
        create: (context) => AzkarCategoriesCubit()..getAzkarCategories(),
        child: BlocBuilder<AzkarCategoriesCubit, AzkarCategoriesState>(
          builder: (context, state) {
            if (state is AzkarCategoriesLoading) {
              return Align(
                alignment: .center,
                child: CircularProgressIndicator(),
              );
            }
            if (state is AzkarCategoriesFailer) {
              return Text(state.error);
            }
            if (state is AzkarCategoriesSuccess) {
              return GridView.builder(
                padding: EdgeInsets.all(15.r),
                itemCount: state.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                  childAspectRatio: 0.64,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ZikrScreen(
                            category: state.categories[index].number,
                            title: state.categories[index].title,
                          ),
                        ),
                      );
                    },
                    child: AzkarAndDuaCategoryCard(category: AzkarCategoryModel(number: state.categories[index].number, title: state.categories[index].title, count: state.categories[index].count, translate: state.categories[index].translate),),
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

