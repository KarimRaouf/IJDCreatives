import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors.dart';
import '../../cubit/attendence_cubit.dart';

class HijriDateListViewIem extends StatelessWidget {
  const HijriDateListViewIem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: !AttendenceCubit.get(context).isTheSameDayNumber(index: index)
              ? AppColors.tealColor
              : AppColors.yellowColor,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        width: 70.w,
        height: 80.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AttendenceCubit.get(context).daysInMonth[index]['monthName'],
                style: TextStyle(
                  fontSize: 10.sp,
                  color: !AttendenceCubit.get(context)
                      .isTheSameDayNumber(index: index)
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              AttendenceCubit.get(context)
                  .daysInMonth[index]['dayNumber']
                  .toInt()
                  .toString()
                  .padLeft(2, '0'),
              style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: !AttendenceCubit.get(context)
                      .isTheSameDayNumber(index: index)
                      ? Colors.white
                      : Colors.black),
            ),
            Text(
              '${AttendenceCubit.get(context).daysInMonth[index]['dayName']}',
              style: TextStyle(
                fontSize: 12.sp,
                color: !AttendenceCubit.get(context)
                    .isTheSameDayNumber(index: index)
                    ? Colors.white
                    : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
