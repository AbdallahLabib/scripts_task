part of 'calendar_cubit.dart';

abstract class CalendarState {}

class CalendarInitial extends CalendarState {}

///drawer icons
class ChangeSelectedDrawerIconIndexState extends CalendarState {}

///create appointment
class ChangeCreateAppointmentVisibilityState extends CalendarState {}

class ChangeSelectedAppointmentTypeIndexState extends CalendarState {}

class ChangeHoveringState extends CalendarState {}

class ChangeSelectedAppointmentFilterIndexState extends CalendarState {}

///calendar
class MonthToLeftState extends CalendarState {}

class MonthToRightState extends CalendarState {}

class OnPageChangedState extends CalendarState {}

///switch
class ChangeSwitchValueState extends CalendarState {}

///slider
class OnChangedSliderState extends CalendarState {}

///speciality options
class ChangeSelectedSpecialityIndexState extends CalendarState {}

///locations
class ChangeSelectedLocationIndexState extends CalendarState {}

///types
class ChangeSelectedTypeIndexState extends CalendarState {}

///prcatice
class ChangeSelectedPracticeIndexState extends CalendarState {}
