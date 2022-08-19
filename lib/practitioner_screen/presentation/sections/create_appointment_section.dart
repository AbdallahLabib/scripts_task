import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_filter_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_type_selections.dart';

class CreateAppointmentSection extends StatelessWidget {
  const CreateAppointmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          //Appointment Type Selections
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: AppointmentTypeSelections(),
          ),

          SizedBox(
            height: 32,
          ),

          //Appointment Filter Selections
          AppointmentFilterSelections(),
        ],
      ),
    );
  }
}
