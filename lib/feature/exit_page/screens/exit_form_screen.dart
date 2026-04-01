import 'package:flutter/material.dart';
import '../exit_theme.dart';
import '../widgets/exit_widgets.dart';
import 'package:flutter/services.dart';

class ExitFormScreen extends StatefulWidget {
  const ExitFormScreen({super.key});

  @override
  State<ExitFormScreen> createState() => _ExitFormScreenState();
}

class _ExitFormScreenState extends State<ExitFormScreen> {
  int _currentState = 0;
  final int _totalSteps = exitSteps.length;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
backgroundColor: ExitColors.bg,
body:Column(children: [
//============== Fixed Header =====================
const ExitAppHeader(),

//================ Step bar ========================

// ExitStepBar(
//   currentStep: _currentStep, 
//   totalSteps : _totalSteps,
//   stepLabel : exitSeps[_currentStep],

// ),




],)



    );
  }
}
