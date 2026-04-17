import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isp_exit_form_implementation/core/constants/app_text_styles.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';

class ExitPageRatings extends StatefulWidget {
  final Map<String, int> ratings;
  final ValueChanged<Map<String, int>> onChanged;
  const ExitPageRatings({
    super.key,
    required this.ratings,
    required this.onChanged,
  });

  @override
  _ExitPageRatingsState createState() => _ExitPageRatingsState();
}

class _ExitPageRatingsState extends State<ExitPageRatings> {
  void _setRating(String aspect, int rating) {
    final updated = Map<String, int>.from(widget.ratings);
    updated[aspect] = rating;
    widget.onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
physics: const BouncingScrollPhysics(),
child: Column(children: [
  ExitSectionHeader(badge: 'C',
  title: 'Job Satisfaction Rating',),
  ExitCard(child: 
  Column(children: [
    Padding(padding: EdgeInsets.only(bottom:8.h),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Text('1 = Very Dissatisfied',
style: AppTextStyle.regular(11).copyWith(
color: ExitColors.textHint)),

Text('5 = Very Satisfied',
style: AppTextStyle.regular(11).copyWith(
  color: ExitColors.textHint,
))

    ],)
    
    ),
    ...List.generate(exitRatingAspects.length, (i){
     final aspect = exitRatingAspects[i];
return ExitStartRatingRow(
  aspect :aspect,
  rating:widget.ratings[aspect] ?? 0,
  onRated :(r) => _setRating(aspect,r),
  isLast : i == exitRatingAspects.length - 1,

);
    }


    ),
    

  ],),)

],),
);

  }
}
