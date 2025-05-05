import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/core/theming/styles.dart';
import 'package:testt/features/attendence/presentation/views/widgets/radial_chart_item.dart';

import '../../../../../core/app_strings.dart';
import '../../../../../core/theming/colors.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkTealColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 92.h,
                    width: 92.w,
                    child: RadialChartItem(
                      value: 80,
                      title: '',
                      max: 100,
                    ),
                  ),
                  Text(AppStrings.attendancePercentage,
                      style: AppStyles.font11WhiteBold),
                  SizedBox(height: 16.h),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 92.h,
                    width: 92.w,
                    child: RadialChartItem(
                      value: 5,
                      title: '',
                      max: 15,
                      isPercentage: false,
                    ),
                  ),
                  Text(AppStrings.todayLectures,
                      style: AppStyles.font11WhiteBold),
                  SizedBox(height: 16.h),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      height: 92.h,
                      width: 92.w,
                      child: RadialChartItem(
                        value: 17,
                        title: '',
                        max: 20,
                        isPercentage: false,
                      )),
                  Text(
                    AppStrings.classNumbers,
                    style: AppStyles.font11WhiteBold,
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
