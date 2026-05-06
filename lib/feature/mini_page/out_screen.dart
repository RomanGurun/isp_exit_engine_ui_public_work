// import 'package:flutter/material.dart';
// import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';
// import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_form_screen.dart';
// import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_signature.dart';
// import 'package:isp_exit_form_implementation/feature/mini_page/out_form_screen.dart';
// import 'package:isp_exit_form_implementation/feature/exit_page/screens/qr_installation.dart';
// import 'package:isp_exit_form_implementation/feature/mini_page/out_sliding_page.dart';

// class OutScreen extends StatelessWidget {
//   OutScreen({super.key});

//   final List<String> items = [
//     "pen",
//     "laptop",
//     "pencil",
//     "football",
//     "mobile",
//     "bike",
//     "house",
//     "cash",
//     "bag",
//     "bottle",
//     'chair',
//     'table',
//     "rounded",
//     "money",
//     "pet animal",
//   ];
//   final List<IconData> icon = [
//     Icons.mobile_off_outlined,
//     Icons.bike_scooter,
//     Icons.house,
//     Icons.ac_unit,
//     Icons.access_alarm_sharp,
//     Icons.dangerous,
//     Icons.air_rounded,
//     Icons.safety_check,
//     Icons.sports_basketball,
//     Icons.satellite_alt_sharp,
//     Icons.safety_divider_sharp,
//     Icons.table_bar_rounded,
//     Icons.dangerous_rounded,
//     Icons.monetization_on,
//     Icons.widgets,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Final Page',
//           style: TextStyle(color: ExitColors.pureBlack),
//         ),
//         centerTitle: true,
//         backgroundColor: ExitColors.g8,

//         // leading: IconButton(onPressed: (){

//         // }, icon: Icon(Icons.menu)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.qr_code_2),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const Scanner()),
//               );
//             },
//           ),
//           IconButton(onPressed: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterFormPage()));


//           }, icon: Icon(Icons.format_indent_decrease_outlined)),

//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SlidingPageUI(),
//                 ),
//               );
//             },
//             icon: Icon(Icons.slideshow),
//           ),


//         ],
//         elevation: 0.7,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
//         ),
//       ),

//       // body: GridView.builder(
//       //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//       //    itemBuilder: (context, index) {
//       //       return Card(
//       //         color: ExitColors.green,
//       //         elevation: 4,
//       //         margin: EdgeInsets.symmetric(vertical: 5),
//       //         child: ListTile(
//       //           // iconColor: ExitColors.g8,
//       //           textColor: ExitColors.pureBlack,

//       //           leading: CircleAvatar(child: Text("${index + 1}"),
//       //           backgroundColor: ExitColors.pureBlack,
//       //           foregroundColor: ExitColors.amber),
//       //           title: Text("${item[index]}"),
//       //           subtitle: Text("This is a subtitle"),
//       //           trailing: Icon(Icons.arrow_forward_ios),
//       //           onTap: () {
//       //             print('Clicked ${item[index]}');
//       //           },
//       //         ),
//       //       );
//       //     },
//       // ),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(
//                 color: const Color.fromRGBO(59, 109, 17, 1),
//                 width: 3,
//               ),
//             ),
//             child: Expanded(
//               child: GridView.builder(
//                 itemCount: icon.length,
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
              
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       print("Tapped on ${items[index]}");
//                     },
//                     child: Card(
//                       color: ExitColors.g8,
//                       elevation: 4,
//                       // margin: EdgeInsets.only(top:10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(
//                                 color: ExitColors.g8,
//                                 width: 2.5,
//                               ),
//                               color: ExitColors.pureWhite,
//                             ),
//                             child: Icon(
//                               icon[index],
//                               size: 30,
//                               color: ExitColors.pureBlack,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             "${items[index]}",
//                             style: TextStyle(
//                               color: ExitColors.pureWhite,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           SizedBox(height: 20),

//           // ===============================Row Widget ====================================
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.center,

//           //   children: [
//           //     Text(
//           //       "Grid View Items Displayed on the screen",
//           //       style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//           //       textAlign: TextAlign.center,
//           //     ),
//           //     SizedBox(width: 10),

//           //     Text(
//           //       "Grid View Items Approved on the screen",
//           //       style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//           //       textAlign: TextAlign.center,
//           //     ),
//           //     SizedBox(height: 20),

//           //     Column(
//           //       children: [
//           //         Text(
//           //           "Column Items Displayed on the screen",
//           //           style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//           //           textAlign: TextAlign.center,
//           //         ),
//           //         SizedBox(width: 10),

//           //         Text(
//           //           "Column Items Approved on the screen",
//           //           style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//           //           textAlign: TextAlign.center,
//           //         ),
//           //         SizedBox(height: 10),

//           //         Text(
//           //           "Extra Items Approved on the screen",
//           //           style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//           //           textAlign: TextAlign.center,
//           //         ),
//           //       ],
//           //     ),
//           //   ],
//           // ),

//           // ===============================Row Widget ====================================

//           // ===============================Row Widget ====================================
//           Expanded(
//             child: SizedBox(
//               height: 1000,
//               child: Container(
//                 padding: EdgeInsets.all(10),
              
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: ExitColors.g8, width: 2.5),
//                   color: ExitColors.g8,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
              
//                   children: [
//                     Text(
//                       "Instruction screen Displayed on the screen",
//                       style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(width: 10),
              
//                     Text(
//                       "ISP Exit Form Instructions Screen",
//                       style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 20),
              
//                     Column(
//                       children: [
//                         Text(
//                           "Equipment Displayed on the screen",
//                           style: TextStyle(
//                             color: ExitColors.pureBlack,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(width: 10),
              
//                         Text(
//                           "Equipment Items Approved on the screen",
//                           style: TextStyle(
//                             color: ExitColors.pureBlack,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 10),
              
//                         Text(
//                           "Extra Items Approved on the screen",
//                           style: TextStyle(
//                             color: ExitColors.pureBlack,
//                             fontSize: 16,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
              
//                     SizedBox(height: 20),
              
//                     // ===============================COLUMN============================================
//                     Padding(
//                       padding: EdgeInsets.only(top: 10),
//                       child: Column(
//                         children: [
//                           Text(
//                             "First Column Items Displayed on the screen",
//                             style: TextStyle(
//                               color: ExitColors.pureBlack,
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               print('doub');
//                             },
//                             child: Text('add'),
//                           ),
              
//               SizedBox(height: 10,),
//                           Text(
//                             "Second Column Items Displayed on the screen",
//                             style: TextStyle(
//                               color: ExitColors.pureBlack,
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
              
//                           SizedBox(height: 10),
              
              
//                           GestureDetector(
//                             onTap: () {
//                               print('doub');
//                             },
//                           child: Text('add'),),
              
              
//               SizedBox(height: 10),
              
              
//                           Text(
//                             "Third Column Items Displayed on the screen",
//                             style: TextStyle(
//                               color: ExitColors.pureBlack,
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
              
//                           SizedBox(width: 10),
              
//                           Text(
//                             "Fourth Column Items Displayed on the screen",
//                             style: TextStyle(
//                               color: ExitColors.pureBlack,
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                           SizedBox(height: 10),
              
//                           Text(
//                             "Extra Items Approved on the screen",
//                             style: TextStyle(
//                               color: ExitColors.pureBlack,
//                               fontSize: 16,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
              
//                     // ===============================COLUMN============================================
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           GestureDetector(onDoubleTap: () {}, child: Text("Tap")),
//           //======================= ListView===============

//   ListView.builder(
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       return Text('Listview item $index');
//     },
//   ),

// SizedBox(height: 10),

// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//   ),
//   itemBuilder: (context, index) {
//     return Text('Grid item Listview $index');
//   },
// ),



//   //======================= ListView===============





//           // ===============================Row Widget ====================================

// // ==============================Routing =====================

// IconButton(
//             icon: Icon(Icons.app_registration_outlined,size: 40,),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) =>  RegisterFormPage()),
//               );
//             },
//           ),

//         ],
//       ),

//       backgroundColor: ExitColors.pureWhite,
//     );
//   }
// }





// =================================Out Screen Page ========================================
import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_form_screen.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_signature.dart';
import 'package:isp_exit_form_implementation/feature/mini_page/out_form_screen.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/qr_installation.dart';
import 'package:isp_exit_form_implementation/feature/mini_page/out_sliding_page.dart';

class OutScreen extends StatelessWidget {
  OutScreen({super.key});

  final List<String> items = [
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
    "rounded",
    "money",
    "pet animal",
  ];
  final List<IconData> icon = [
    Icons.mobile_off_outlined,
    Icons.bike_scooter,
    Icons.house,
    Icons.ac_unit,
    Icons.access_alarm_sharp,
    Icons.dangerous,
    Icons.air_rounded,
    Icons.safety_check,
    Icons.sports_basketball,
    Icons.satellite_alt_sharp,
    Icons.safety_divider_sharp,
    Icons.table_bar_rounded,
    Icons.dangerous_rounded,
    Icons.monetization_on,
    Icons.widgets,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Final Page',
          style: TextStyle(color: ExitColors.pureBlack),
        ),
        centerTitle: true,
        backgroundColor: ExitColors.g8,

        // leading: IconButton(onPressed: (){

        // }, icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_2),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Scanner()),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterFormPage(),
                ),
              );
            },
            icon: Icon(Icons.format_indent_decrease_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SlidingPageUI()),
              );
            },
            icon: Icon(Icons.slideshow),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromRGBO(59, 109, 17, 1),
                  width: 3,
                ),
              ),
              // FIX 1: Removed Expanded (invalid inside Container).
              // GridView already has shrinkWrap: true so no Expanded needed.
              child: GridView.builder(
                itemCount: icon.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: ExitColors.g8,
                                width: 2.5,
                              ),
                              color: ExitColors.pureWhite,
                            ),
                            child: Icon(
                              icon[index],
                              size: 30,
                              color: ExitColors.pureBlack,
                            ),
                          ),
                          const SizedBox(height: 10),
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

            SizedBox(height: 20),

            // ===============================Row Widget ====================================
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,

            //   children: [
            //     Text(
            //       "Grid View Items Displayed on the screen",
            //       style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
            //       textAlign: TextAlign.center,
            //     ),
            //     SizedBox(width: 10),

            //     Text(
            //       "Grid View Items Approved on the screen",
            //       style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
            //       textAlign: TextAlign.center,
            //     ),
            //     SizedBox(height: 20),

            //     Column(
            //       children: [
            //         Text(
            //           "Column Items Displayed on the screen",
            //           style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
            //           textAlign: TextAlign.center,
            //         ),
            //         SizedBox(width: 10),

            //         Text(
            //           "Column Items Approved on the screen",
            //           style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
            //           textAlign: TextAlign.center,
            //         ),
            //         SizedBox(height: 10),

            //         Text(
            //           "Extra Items Approved on the screen",
            //           style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
            //           textAlign: TextAlign.center,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

            // ===============================Row Widget ====================================

            // ===============================Row Widget ====================================

            // FIX 2: Replaced Expanded + SizedBox(height:1000) with a plain
            // Container so it works correctly inside SingleChildScrollView.
            // FIX 3: Wrapped Row children in Flexible to prevent horizontal overflow.
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ExitColors.g8, width: 2.5),
                color: ExitColors.g8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "Instruction screen Displayed on the screen",
                      style: TextStyle(
                        color: ExitColors.pureBlack,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 10),

                  Flexible(
                    child: Text(
                      "ISP Exit Form Instructions Screen",
                      style: TextStyle(
                        color: ExitColors.pureBlack,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),

                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          "Equipment Displayed on the screen",
                          style: TextStyle(
                            color: ExitColors.pureBlack,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 10),

                        Text(
                          "Equipment Items Approved on the screen",
                          style: TextStyle(
                            color: ExitColors.pureBlack,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),

                        Text(
                          "Extra Items Approved on the screen",
                          style: TextStyle(
                            color: ExitColors.pureBlack,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // ===============================COLUMN============================================
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            "First Column Items Displayed on the screen",
                            style: TextStyle(
                              color: ExitColors.pureBlack,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('doub');
                            },
                            child: Text('add'),
                          ),

                          SizedBox(height: 10),
                          Text(
                            "Second Column Items Displayed on the screen",
                            style: TextStyle(
                              color: ExitColors.pureBlack,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 10),

                          GestureDetector(
                            onTap: () {
                              print('doub');
                            },
                            child: Text('add'),
                          ),

                          SizedBox(height: 10),

                          Text(
                            "Third Column Items Displayed on the screen",
                            style: TextStyle(
                              color: ExitColors.pureBlack,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(width: 10),

                          Text(
                            "Fourth Column Items Displayed on the screen",
                            style: TextStyle(
                              color: ExitColors.pureBlack,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10),

                          Text(
                            "Extra Items Approved on the screen",
                            style: TextStyle(
                              color: ExitColors.pureBlack,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ===============================COLUMN============================================
                ],
              ),
            ),

            GestureDetector(onDoubleTap: () {}, child: Text("Tap")),

            //======================= ListView===============

            // FIX 4: Wrapped ListView.builder in SizedBox with fixed height.
            // ListView needs a bounded height constraint inside a Column.
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Text('Listview item $index');
                },
              ),
            ),

            SizedBox(height: 10),

            // FIX 5: Wrapped GridView.builder in SizedBox with fixed height.
            // FIX 6: Added itemCount (was missing — caused infinite items).
            SizedBox(
              height: 400,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Text('Grid item Listview $index');
                },
              ),
            ),

            //======================= ListView===============

            // ===============================Row Widget ====================================

            // ==============================Routing =====================
            IconButton(
              icon: Icon(Icons.app_registration_outlined, size: 40),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterFormPage()),
                );
              },
            ),
          ],
        ),
      ),

      backgroundColor: ExitColors.pureWhite,
    );
  }
}
