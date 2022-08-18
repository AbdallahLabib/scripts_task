import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:scripts_task/practitioner_screen/data/models/view_models/practitioner_model.dart';
import 'package:scripts_task/shared/assets/assets.gen.dart';

part 'practitioner_state.dart';

class PractitionerCubit extends Cubit<PractitionerState> {
  PractitionerCubit() : super(PractitionerInitial());

  static PractitionerCubit get(context) => BlocProvider.of(context);

  ///practitiner
  List<Practitoner> practitioners = [
    Practitoner(
      id: 0,
      name: "Mark Black",
      imagePath: Assets.images.maleUser.path,
    ),
    Practitoner(
      id: 1,
      name: "Annete Black",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 2,
      name: "Courtenry Henry",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 3,
      name: "Dourlene Robertson",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 4,
      name: "Elaner Pena",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 5,
      name: "Albert Flores",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 6,
      name: "Esther Howard",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 7,
      name: "Jane Cooper",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 8,
      name: "Robert Fox",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 9,
      name: "Esther Howard",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 10,
      name: "Jacob Jones",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 11,
      name: "Devon Lane",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 12,
      name: "Theresa Webb",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 13,
      name: "Jenny Wilson",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 14,
      name: "Marvin McKinney",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 15,
      name: "Lesile Alexander",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 16,
      name: "Lesile Alexander",
      imagePath: Assets.icons.dummyUser.path,
    ),
    Practitoner(
      id: 17,
      name: "Lesile Alexander",
      imagePath: Assets.icons.dummyUser.path,
    ),
  ];

//grid
  
}
