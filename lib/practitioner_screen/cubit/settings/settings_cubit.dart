import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/data/models/view_models/selections_model.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';
import 'package:table_calendar/table_calendar.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  //fixed drawer
  int selectedDrawerIconIndex = 1;

  List<String> drawerItemLabels = [
    "Dashboard",
    "Calendar",
    "Clinical",
    "Patients",
    "Billing",
    "Notifications",
    "Help",
  ];

  changeToSelectedDrawerIconIndex(int currIndex) {
    selectedDrawerIconIndex = currIndex;
    emit(ChangeToSelectedDrawerIconIndexState());
  }

  //create appointment
  bool isOpen = false;

  changeVisibility() {
    isOpen = !isOpen;
    emit(ChangeCreateAppointmentVisibilityState());
  }

  ///calendar
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  monthToRight() {
    focusedDay = DateTime(focusedDay.year, focusedDay.month + 1);
    emit(MonthToRightState());
  }

  monthToLeft() {
    focusedDay = DateTime(focusedDay.year, focusedDay.month - 1);
    emit(MonthToLeftState());
  }

  void Function(DateTime)? onPageChanged(DateTime day) {
    focusedDay = day;
    emit(OnPageChangedState());
    return null;
  }

  selectedDayPredicate(DateTime day) => isSameDay(selectedDay, day);

  onDaySelected(selectedDay, focusedDay) {
    if (!isSameDay(selectedDay, selectedDay)) {
      selectedDay = selectedDay;
      focusedDay = focusedDay;
    }
  }

  ///switch
  bool swithcValue = false;
  changeSwitchValue(bool value) {
    swithcValue = value;
    emit(ChangeSwitchValueState());
  }

  ///slider
  RangeValues range = const RangeValues(0, 5);
  onChanged(RangeValues value) {
    range = value;
    emit(OnChangedSliderState());
  }

  String timeRange() {
    return "from " +
        (1 + range.start).toStringAsPrecision((1 + range.start) < 10 ? 3 : 4) +
        " to " +
        (1 + range.end).toStringAsPrecision((1 + range.end) < 10 ? 3 : 4);
  }

  ///speciality options
  int selectedSpecialityIndex = 0;

  List<Selections> labels = [
    Selections(id: 0, label: "All"),
    Selections(id: 1, label: "General Practice"),
    Selections(id: 2, label: "OB-GYN"),
    Selections(id: 3, label: "ENT"),
    Selections(id: 4, label: "Physiotherapy"),
    Selections(id: 5, label: "+3 more"),
  ];

  changeToSelectedSpeciality(int currIndex) {
    selectedSpecialityIndex = currIndex;
    emit(ChangeToSelectedSpecialityIndexState());
  }

  ///speciality options
  int selectedLocationIndex = 0;

  List<Selections> locations = [
    Selections(id: 0, label: "Office", icon: Assets.icons.plus.path),
    Selections(id: 1, label: "Home", icon: Assets.icons.home.path),
    Selections(id: 2, label: "virtual", icon: Assets.icons.video.path),
  ];

  changeToSelectedLocation(int currIndex) {
    selectedLocationIndex = currIndex;
    emit(ChangeToSelectedLocationIndexState());
  }

  ///type options
  int selectedTypeIndex = 0;

  List<Selections> types = [
    Selections(id: 0, label: "First Time", icon: Assets.icons.firstTime.path),
    Selections(id: 1, label: "Follow Up", icon: Assets.icons.followUp.path),
    Selections(id: 2, label: "Walk In", icon: Assets.icons.walkIn.path),
  ];

  changeToSelectedType(int currIndex) {
    selectedTypeIndex = currIndex;
    emit(ChangeToSelectedTypeIndexState());
  }

  ///practice
  int selectedPracticeIndex = 0;

  List<Selections> practice = [
    Selections(
        id: 0,
        label: "Primary Clinic Dubai",
        icon: Assets.images.hospital.path),
  ];

  changeToSelectedPractice(int currIndex) {
    selectedTypeIndex = currIndex;
    emit(ChangeToSelectedPracticeIndexState());
  }
}
