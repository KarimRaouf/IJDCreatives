import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testt/core/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../cubit/attendence_cubit.dart';

class AttendenceView extends StatefulWidget {
  const AttendenceView({super.key});

  @override
  State<AttendenceView> createState() => _AttendenceViewState();
}

class _AttendenceViewState extends State<AttendenceView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AttendenceCubit.get(context).getDaysInMonth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendenceCubit, AttendenceState>(
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
                  child: StatisticsBackground(),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: HijriDateUpperBackground(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HijriDateUpperBackground extends StatelessWidget {
  const HijriDateUpperBackground({super.key});

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
              DateListView(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticsBackground extends StatelessWidget {
  const StatisticsBackground({super.key});

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
                    child: RadialChart(
                      value: 80,
                      title: '',
                      max: 100,
                    ),
                  ),
                  Text(
                    'نسبة الحضور',
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 92.h,
                    width: 92.w,
                    child: RadialChart(
                      value: 5,
                      title: '',
                      max: 15,
                      isPercentage: false,
                    ),
                  ),
                  Text(
                    'حصص اليوم',
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                      height: 92.h,
                      width: 92.w,
                      child: RadialChart(
                        value: 17,
                        title: '',
                        max: 20,
                        isPercentage: false,
                      )),
                  Text(
                    'عدد الفصول',
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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

class DateListViewIem extends StatelessWidget {
  const DateListViewIem({super.key, required this.index});

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
            width: 2.0,
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

class DateListView extends StatelessWidget {
  const DateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 80.h,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => DateListViewIem(
            index: index,
          ),
          itemCount: AttendenceCubit.get(context).daysInMonth.length,
        ),
      ),
    );
  }
}

class RadialChart extends StatelessWidget {
  final double value; // Value between 0-100
  final double max; // Value between 0-100
  final String title;
  final Color progressColor;
  final Color backgroundColor;
  final bool isPercentage;

  const RadialChart({
    super.key,
    required this.value,
    required this.title,
    this.progressColor = AppColors.yellowColor,
    this.backgroundColor = AppColors.tealColor,
    required this.max,
    this.isPercentage = true,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: max,
          startAngle: 270,
          // Start from top
          endAngle: 270,
          // Complete 360-degree circle
          showLabels: false,
          showTicks: false,
          showFirstLabel: false,
          radiusFactor: 0.8,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            cornerStyle: CornerStyle.bothCurve,
            color: backgroundColor,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
              value: value,
              width: 0.2,
              color: progressColor,
              cornerStyle: CornerStyle.bothCurve,
              sizeUnit: GaugeSizeUnit.factor,
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: isPercentage
                        ? TextSpan(
                            children: [
                              TextSpan(
                                text: '%',
                                style: TextStyle(
                                  fontSize: 12.sp, // Slightly smaller % symbol
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: value.toStringAsFixed(0),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  // Increase font size for better visibility
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        : TextSpan(
                            children: [
                              TextSpan(
                                text: value.toStringAsFixed(0),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  // Increase font size for better visibility
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 5),
                  // Optional: Add some space between the number and title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              angle: 90, // Control the rotation of the annotation
              positionFactor:
                  0.2, // Controls the center position, 0.5 is center
            ),
          ],
        ),
      ],
    );
  }
}
