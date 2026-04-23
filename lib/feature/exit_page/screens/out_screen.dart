import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_form_screen.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_signature.dart';

class OutScreen extends StatelessWidget {
  OutScreen({super.key});

  final List items = [
    "pen",
    "laptop",
    "pencil",
    "football",
    "mobile",
    "bike",
    "house",
    "cash",
    "bag",
    "bottle",
    'chair',
    'table',
  ];
  final List icon = [
    Icons.mobile_off_outlined,
    Icons.bike_scooter,
    Icons.house,
    Icons.ac_unit,
    Icons.access_alarm_sharp,
    Icons.dangerous,
    Icons.air_rounded,
    Icons.safety_check,
    Icons.safety_check,
    Icons.safety_check,
    Icons.safety_check,
    Icons.safety_check,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Title Page',
          style: TextStyle(color: ExitColors.pureBlack),
        ),
        centerTitle: true,
        backgroundColor: ExitColors.g8,

        // leading: IconButton(onPressed: (){

        // }, icon: Icon(Icons.menu)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExitFormScreen(),
                ),
              );
            },
            icon: Icon(Icons.home),
          ),
        ],
        elevation: 0.7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),

      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      //    itemBuilder: (context, index) {
      //       return Card(
      //         color: ExitColors.green,
      //         elevation: 4,
      //         margin: EdgeInsets.symmetric(vertical: 5),
      //         child: ListTile(
      //           // iconColor: ExitColors.g8,
      //           textColor: ExitColors.pureBlack,

      //           leading: CircleAvatar(child: Text("${index + 1}"),
      //           backgroundColor: ExitColors.pureBlack,
      //           foregroundColor: ExitColors.amber),
      //           title: Text("${item[index]}"),
      //           subtitle: Text("This is a subtitle"),
      //           trailing: Icon(Icons.arrow_forward_ios),
      //           onTap: () {
      //             print('Clicked ${item[index]}');
      //           },
      //         ),
      //       );
      //     },
      // ),
      body: Container(
        margin: EdgeInsets.only(top:30,left: 10,right: 10,bottom: 10),
        padding: EdgeInsets.all(20),
        height: 600,
        decoration: BoxDecoration(
          color: ExitColors.pureWhite,

          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: ExitColors.g8, width: 3.3),
        ),
        child: GridView.builder(
          itemCount: icon.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,

            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("Tapped on ${items[index]}");
              },
              child: Card(
                color: ExitColors.g8,
                elevation: 4,
                // margin: EdgeInsets.only(top:10),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        
                        margin: EdgeInsets.only(top: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ExitColors.g8, width: 2.5),
color: ExitColors.pureWhite,
                        ),
                        child: Icon(
                          icon[index],
                          size: 30,
                          color: ExitColors.pureBlack,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "${items[index]}",
                      style: TextStyle(
                        color: ExitColors.pureWhite,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      backgroundColor: ExitColors.pureWhite,
    );
  }
}
