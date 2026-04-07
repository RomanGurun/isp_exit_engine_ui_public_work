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
  State<ExitPageReasons> createState() => _ExitPageReasonsState();
}

class _ExitPageReasonsState extends State<ExitPageReasons> {
  void _toggle(String reason, bool selected) {
    final updated = Set<String>.from(widget.selectedReasons);
    if (selected) {
      updated.add(reason);
    } else {
      updated.remove(reason);
    }
    widget.onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      behavior: HitTestBehavior.translucent, // ✅ catches taps in empty areas too
      child: CustomScrollView(
        // ✅ CustomScrollView handles IME insets more smoothly than
        //    SingleChildScrollView — fewer rebuilds on keyboard open/close
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ExitSectionHeader(
                  badge: 'B',
                  title: 'Primary Reason for Leaving',
                ),
                ExitCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ RepaintBoundary isolates checkbox repaints
                      //    from the TextField repaints
                      RepaintBoundary(
                        child: Column(
                          children: exitReasons
                              .map(
                                (r) => ExitCheckItem(
                                  label: r,
                                  selected: widget.selectedReasons.contains(r),
                                  onToggled: (v) => _toggle(r, v),
                                ),
                              )
                              .toList(),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      // ✅ RepaintBoundary isolates TextField repaints
                      //    so keyboard open/close doesn't repaint checkboxes
                      RepaintBoundary(
                        child: ExitTextField(
                          label: 'Other — specify',
                          controller: widget.otherController,
                          hint: 'Describe your reason...',
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
// =======================Github Code =====================

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../exit_theme.dart';
// import '../widgets/exit_widgets.dart';

// class ExitPageReasons extends StatefulWidget {
//   /// Selected reasons passed from parent state — wire to Bloc later
//   final Set<String> selectedReasons;
//   final ValueChanged<Set<String>> onChanged;
//   final TextEditingController otherController;

//   const ExitPageReasons({
//     super.key,
//     required this.selectedReasons,
//     required this.onChanged,
//     required this.otherController,
//   });

//   @override
//   State<ExitPageReasons> createState() => _ExitPageReasonsState();
// }

// class _ExitPageReasonsState extends State<ExitPageReasons> {
//   void _toggle(String reason, bool selected) {
//     final updated = Set<String>.from(widget.selectedReasons);
//     if (selected) {
//       updated.add(reason);
//     } else {
//       updated.remove(reason);
//     }
//     widget.onChanged(updated);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
//       physics: const BouncingScrollPhysics(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ExitSectionHeader(badge: 'B', title: 'Primary Reason for Leaving'),
//           ExitCard(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ...exitReasons.map(
//                   (r) => ExitCheckItem(
//                     label: r,
//                     selected: widget.selectedReasons.contains(r),
//                     onToggled: (v) => _toggle(r, v),
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 ExitTextField(
//                   label: 'Other — specify',
//                   controller: widget.otherController,
//                   hint: 'Describe your reason...',
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
