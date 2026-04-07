import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

class ExitPageReasons extends StatefulWidget {
  final Set<String> selectedReasons;
  final ValueChanged<Set<String>> onChanged;
  final TextEditingController otherController;

  const ExitPageReasons({
    super.key,
    required this.selectedReasons,
    required this.onChanged,
    required this.otherController,
  });

  @override
  _ExitPageReasonsState createState() => _ExitPageReasonsState();
}

class _ExitPageReasonsState extends State<ExitPageReasons> {
  void _toggle(String reason, bool selected) {
    final update = Set<String>.from(widget.selectedReasons);
    if (selected) {
      update.add(reason);
    } else {
      update.remove(reason);
    }
    widget.onChanged(update);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
    physics: const BouncingScrollPhysics(),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
ExitSectionHeader(badge: 'B', title: 'Priary Reason for Leaving'),
ExitCard(child: Column(children: [


...exitReasons.map((r) => ExitCheckItem(
  label:r,
  selected:widget.selectedReasons.contains(r),
  onToggled:(v) => _toggle(r,v),


)),
SizedBox(height: 10.h,),
  
  ExitTextField(
  label:'Other - specify',
  controller:widget.otherController,
  hint:'Describe your reason ...',
),

],),)



    ],)
    
    );
  }
}
