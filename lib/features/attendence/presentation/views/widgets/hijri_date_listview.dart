import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/attendence_cubit.dart';
import 'hijri_date_listview_item.dart';

class HijriDateListView extends StatelessWidget {
  const HijriDateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 80.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => HijriDateListViewIem(
            index: index,
          ),
          itemCount: AttendenceCubit.get(context).daysInMonth.length,
        ),
      ),
    );
  }
}
