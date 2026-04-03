import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

class ExitPageEmployeeInfo extends StatelessWidget {
  const ExitPageEmployeeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final e = dummyEmployee;

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ExitSectionHeader(badge: 'A', title: 'Employee Information'),

          ExitCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ExitAutoFilledBadge(),

                _FieldRow(children:[
                ExitReadOnlyField(label:'Employee Name', value:e.name),

                ExitReadOnlyField(label:'Employee Id',value:e.employeeId),
                ]),
                SizedBox(height: 12.h,),
                _FieldRow(children:[
                ExitReadOnlyField(label:'Job Title', value:e.jobTitle),
                ExitReadOnlyField(label:'Department',value:e.department),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FiledRow extends StatelessWidget {
  const _FiledRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}