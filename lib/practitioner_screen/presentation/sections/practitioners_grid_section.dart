import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scripts_task/practitioner_screen/cubit/practitioner/practitioner_cubit.dart';
import 'package:scripts_task/practitioner_screen/presentation/widgets/practitioner_info_card.dart';

class PractitionersGridSection extends StatefulWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const PractitionersGridSection({
    Key? key,
    required this.crossAxisCount,
    required this.childAspectRatio,
  }) : super(key: key);

  @override
  State<PractitionersGridSection> createState() =>
      _PractitionersGridSectionState();
}

class _PractitionersGridSectionState extends State<PractitionersGridSection> {
  final ScrollController _scrollController = ScrollController();
  late final PractitionerCubit cubit;

  @override
  void initState() {
    cubit = PractitionerCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PractitionerCubit, PractitionerState>(
      builder: (context, state) {
        return SizedBox(
          height: 754,
          child: GridView.builder(
            itemCount: cubit.practitioners.length,
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
              childAspectRatio: widget.childAspectRatio,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return PractitionerInfoCard(
                id: cubit.practitioners[index].id,
                name: cubit.practitioners[index].name,
                imagePath: cubit.practitioners[index].imagePath,
              );
            },
          ),
        );
      },
    );
  }
}
