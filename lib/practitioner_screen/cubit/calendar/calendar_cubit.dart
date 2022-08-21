import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripts_task/practitioner_screen/data/models/view_models/selection_model.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());

  static CalendarCubit get(context) => BlocProvider.of(context);

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

  changeSelectedDrawerIconIndex(int currIndex) {
    selectedDrawerIconIndex = currIndex;
    emit(ChangeSelectedDrawerIconIndexState());
  }

  //create appointment
  bool isOpen = false;

  changeVisibility() {
    selectedAppointmentFilterIndex =
        isPractitionerSelected ? selectedAppointmentFilterIndex : 0;
    isOpen = !isOpen;
    emit(ToggleCreateAppointmentVisibilityState());
  }

  int selectedAppointmentTypeIndex = 0;

  List<Selection> appointmentType = [
    Selection(id: 0, name: "General"),
    Selection(id: 1, name: "Group"),
    Selection(id: 2, name: "Block Slot"),
    Selection(id: 3, name: "Advanced"),
    Selection(id: 4, name: "Walk In"),
  ];

  changeSelectedAppointmentType(int currIndex) {
    selectedAppointmentTypeIndex = currIndex;
    emit(ChangeSelectedAppointmentTypeIndexState());
  }

/*   bool isHovering = false;
  onHoverAppointmentType(bool hoverState) {
    isHovering = hoverState;
    emit(ChangeHoveringState());
  }

  int hoverIndex = 0;
  changeHoverState(int currIndex) {
    hoverIndex = currIndex;
    emit(ChangeHoveringState());
  } */

  int selectedAppointmentFilterIndex = 0;

  List<Selection> appointmentFilters = [
    Selection(id: 0, name: "Practitioner"),
    Selection(id: 1, name: "Profile, date & time"),
    Selection(id: 2, name: "Service & payment"),
    Selection(id: 3, name: "Patient"),
    Selection(id: 4, name: "Notes"),
  ];

  changeSelectedAppointmentFilter(int currIndex) {
    selectedAppointmentFilterIndex = currIndex;
    emit(ChangeSelectedAppointmentFilterIndexState());
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

  List<Selection> labels = [
    Selection(id: 0, name: "All"),
    Selection(id: 1, name: "General Practice"),
    Selection(id: 2, name: "OB-GYN"),
    Selection(id: 3, name: "ENT"),
    Selection(id: 4, name: "Physiotherapy"),
    Selection(id: 5, name: "+3 more"),
  ];

  changeSelectedSpeciality(int currIndex) {
    selectedSpecialityIndex = currIndex;
    emit(ChangeSelectedSpecialityIndexState());
  }

  ///speciality options
  int selectedLocationIndex = 0;

  List<Selection> locations = [
    Selection(id: 0, name: "Office", imagePath: Assets.icons.plus.path),
    Selection(id: 1, name: "Home", imagePath: Assets.icons.home.path),
    Selection(id: 2, name: "virtual", imagePath: Assets.icons.video.path),
  ];

  changeSelectedLocation(int currIndex) {
    selectedLocationIndex = currIndex;
    emit(ChangeSelectedLocationIndexState());
  }

  ///type options
  int selectedTypeIndex = 0;

  List<Selection> types = [
    Selection(
        id: 0, name: "First Time", imagePath: Assets.icons.firstTime.path),
    Selection(id: 1, name: "Follow Up", imagePath: Assets.icons.followUp.path),
    Selection(id: 2, name: "Walk In", imagePath: Assets.icons.walkIn.path),
  ];

  changeSelectedType(int currIndex) {
    selectedTypeIndex = currIndex;
    emit(ChangeSelectedTypeIndexState());
  }

  ///practice
  int selectedPracticeIndex = 0;

  List<Selection> practice = [
    Selection(
        id: 0,
        name: "Primary Clinic Dubai",
        imagePath: Assets.images.hospital.path),
  ];

  changeSelectedPractice(int currIndex) {
    selectedTypeIndex = currIndex;
    emit(ChangeSelectedPracticeIndexState());
  }

  ///practitiner
  bool isPractitionerSelected = false;
  Selection selectedPractitioner(Selection practitoner) {
    toggleIsPractitionerSelected();

    changeSelectedAppointmentFilter(1);

    isOpen = true;
    emit(ToggleCreateAppointmentVisibilityState());

    appointmentFilters.removeAt(0);
    appointmentFilters.insert(0, practitoner);
    emit(UpdateSelectedPractionerState());
    return practitoner;
  }

  toggleIsPractitionerSelected() {
    isPractitionerSelected = !isPractitionerSelected;
    emit(ToggleIsPractitionerSelected());
  }

  List<Selection> practitioners = [
    Selection(
      id: 0,
      name: "Mark Black",
      imagePath: Assets.images.maleUser.path,
    ),
    Selection(
      id: 1,
      name: "Annete Black",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 2,
      name: "Courtenry Henry",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 3,
      name: "Dourlene Robertson",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 4,
      name: "Elaner Pena",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 5,
      name: "Albert Flores",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 6,
      name: "Esther Howard",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 7,
      name: "Jane Cooper",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 8,
      name: "Robert Fox",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 9,
      name: "Esther Howard",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 10,
      name: "Jacob Jones",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 11,
      name: "Devon Lane",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 12,
      name: "Theresa Webb",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 13,
      name: "Jenny Wilson",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 14,
      name: "Marvin McKinney",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 15,
      name: "Lesile Alexander",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 16,
      name: "Lesile Alexander",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Selection(
      id: 17,
      name: "Lesile Alexander",
      imagePath: Assets.icons.dummyUser.path,
    ),
  ];
}
