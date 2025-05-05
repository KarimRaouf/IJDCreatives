import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors.dart';
import '../../cubit/attendence_cubit.dart';
import 'hijri_date_listview.dart';

class HijriDateItem extends StatelessWidget {
  const HijriDateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.tealColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      width: double.infinity,
      height: 260.h,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Text(
                  AttendenceCubit.get(context).getFormattedHijriDate(),
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12.h),
              HijriDateListView(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
