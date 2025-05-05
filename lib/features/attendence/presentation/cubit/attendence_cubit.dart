
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:meta/meta.dart';

part 'attendence_state.dart';

class AttendenceCubit extends Cubit<AttendenceState> {
  AttendenceCubit() : super(AttendenceInitial());

  static AttendenceCubit get(context) => BlocProvider.of(context);

  HijriCalendar now = HijriCalendar.now();

  String getFormattedHijriDate() {
    final String weekday = now.getDayName();
    final String day = now.hDay.toInt().toString().padLeft(2, '0');
    final String month = now.getLongMonthName();
    final String year = now.hYear.toString();
    return '$weekday، $day $month $yearهـ';
  }

  List<Map<String, dynamic>> daysInMonth = [];

  void getDaysInMonth() {
    HijriCalendar.setLocal('ar');

    final HijriCalendar now = HijriCalendar.now();
    int hijriYear = now.hYear;
    int hijriMonth = now.hMonth;

    emit(AttendenceDaysLoading());
    for (int day = 1; day <= 30; day++) {
      try {
        final HijriCalendar date = HijriCalendar()
          ..hYear = hijriYear
          ..hMonth = hijriMonth
          ..hDay = day;

        final DateTime gregorianDate = date.hijriToGregorian(
          hijriYear,
          hijriMonth,
          day,
        );

        if (date.hMonth == hijriMonth) {
          final formatted = {
            'dayName': _getArabicDayName(gregorianDate.weekday),
            'dayNumber': date.hDay,
            'monthName': date.getLongMonthName(),
            'year': date.hYear,
          };
          daysInMonth.add(formatted);
        } else {
          break;
        }
        emit(AttendenceDaysSuccess());
      } catch (e) {
        emit(AttendenceDaysError());
        break;
      }
    }
  }

  String _getArabicDayName(int weekday) {
    switch (weekday) {
      case DateTime.saturday:
        return 'السبت';
      case DateTime.sunday:
        return 'الأحد';
      case DateTime.monday:
        return 'الاثنين';
      case DateTime.tuesday:
        return 'الثلاثاء';
      case DateTime.wednesday:
        return 'الأربعاء';
      case DateTime.thursday:
        return 'الخميس';
      case DateTime.friday:
        return 'الجمعة';
      default:
        return '';
    }
  }

  bool isTheSameDayNumber({required int index}) {
    return now.hDay == daysInMonth[index]['dayNumber'];
  }
}
