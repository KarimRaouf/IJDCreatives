import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/features/attendence/presentation/views/widgets/hijri_date_item.dart';

import '../cubit/attendence_cubit.dart';
import 'widgets/statistics_item.dart';

class AttendenceView extends StatelessWidget {
  const AttendenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendenceCubit()..getDaysInMonth(),
      child: BlocBuilder<AttendenceCubit, AttendenceState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 60.h,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 330.h,
                    child: StatisticsItem(),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: HijriDateItem(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}





