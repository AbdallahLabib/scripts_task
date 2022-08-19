import 'package:flutter/material.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_filter_selections.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/appointment_type_selections.dart';

class CreateAppointmentSection extends StatelessWidget {
  const CreateAppointmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 812,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          SizedBox(
            height: 48,
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
                child: const Center(
                  child: Text("create"),
                )),
          )
        ],
      ),
    );
  }
}
