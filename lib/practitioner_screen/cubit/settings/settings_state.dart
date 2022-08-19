part of 'settings_cubit.dart';

abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

///drawer icons
class ChangeToSelectedDrawerIconIndexState extends SettingsState {}

///create appointment
class ChangeCreateAppointmentVisibilityState extends SettingsState{}

class ChangeToSelectedAppointmentTypeIndexState extends SettingsState{}

class ChangeToSelectedAppointmentFilterIndexState extends SettingsState{}

///calendar
class MonthToLeftState extends SettingsState {}

class MonthToRightState extends SettingsState {}

class OnPageChangedState extends SettingsState {}

///switch
class ChangeSwitchValueState extends SettingsState {}

///slider
class OnChangedSliderState extends SettingsState {}

///speciality options
class ChangeToSelectedSpecialityIndexState extends SettingsState {}

///locations
class ChangeToSelectedLocationIndexState extends SettingsState {}

///types
class ChangeToSelectedTypeIndexState extends SettingsState {}

///prcatice
class ChangeToSelectedPracticeIndexState extends SettingsState {}
