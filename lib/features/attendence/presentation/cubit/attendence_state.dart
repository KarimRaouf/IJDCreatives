part of 'attendence_cubit.dart';

@immutable
sealed class AttendenceState {}

final class AttendenceInitial extends AttendenceState {}

class AttendenceDaysLoading extends AttendenceState {}

class AttendenceDaysSuccess extends AttendenceState {}

class AttendenceDaysError extends AttendenceState {}
