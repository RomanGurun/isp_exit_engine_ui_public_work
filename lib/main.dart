import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_form_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(home: child, debugShowCheckedModeBanner: false);
      },
      child: ExitFormScreen(),
    );
  }
}
