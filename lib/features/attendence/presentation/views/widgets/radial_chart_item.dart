import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../core/colors.dart';

class RadialChartItem extends StatelessWidget {
  final double value;
  final double max;
  final String title;
  final Color progressColor;
  final Color backgroundColor;
  final bool isPercentage;

  const RadialChartItem({
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
          endAngle: 270,
          showLabels: false,
          showTicks: false,
          showFirstLabel: false,
          radiusFactor: 0.8,
          axisLineStyle: AxisLineStyle(
            thickness: 0.2,
            cornerStyle: CornerStyle.startCurve,
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
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: value.toStringAsFixed(0),
                          style: TextStyle(
                            fontSize: 20.sp,
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
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
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
              angle: 90,
              positionFactor:
              0.2,
            ),
          ],
        ),
      ],
    );
  }
}
