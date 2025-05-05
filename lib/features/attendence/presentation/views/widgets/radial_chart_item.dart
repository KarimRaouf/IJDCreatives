import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testt/core/theming/styles.dart';

import '../../../../../core/theming/colors.dart';


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
                          style:AppStyles.font12WhiteBold
                        ),
                        TextSpan(
                          text: value.toStringAsFixed(0),
                          style: AppStyles.font20WhiteBold
                        ),
                      ],
                    )
                        : TextSpan(
                      children: [
                        TextSpan(
                          text: value.toStringAsFixed(0),
                          style:AppStyles.font20WhiteBold
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    title,
                    style: AppStyles.font10WhiteBold
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
