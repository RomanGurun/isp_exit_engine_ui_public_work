import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_form_screen.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/exit_page_signature.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/screens/qr_installation.dart';

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
    "pet animal"
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
     Icons.widgets
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
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
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
      body: Column(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                "Grid View Items Displayed on the screen",
                style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 10),

              Text(
                "Grid View Items Approved on the screen",
                style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                textAlign: TextAlign.center,
              ),
SizedBox(height: 20),

Column(
  children: [
            Text(
                "Column Items Displayed on the screen",
                style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(width: 10),

              Text(
                "Column Items Approved on the screen",
                style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                textAlign: TextAlign.center,
              ),
                  SizedBox(height: 10),


                  Text(
                    "Extra Items Approved on the screen",
                    style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),








],)


            ],
          ),


// ===============================Row Widget ====================================


// ===============================Row Widget ====================================
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ExitColors.g8,
                width: 2.5,
              ),
              color: ExitColors.g8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            
              children: [
                Text(
                  "Instruction screen Displayed on the screen",
                  style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 10),
            
                Text(
                  "ISP Exit Form Instructions Screen",
                  style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
            
                Column(
                  children: [
                    Text(
                      "Equipment Displayed on the screen",
                      style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 10),
            
                    Text(
                      "Equipment Items Approved on the screen",
                      style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
            
                    Text(
                      "Extra Items Approved on the screen",
                      style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
            
            
                SizedBox(height: 20),
            
            
            // ===============================COLUMN============================================
            
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        "First Column Items Displayed on the screen",
                        style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                  
                      Text(
                        "Second Column Items Displayed on the screen",
                        style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                  
                      SizedBox(height: 10),
                  
                      Text(
                        "Third Column Items Displayed on the screen",
                        style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                  
                      SizedBox(width: 10),
                  
                      Text(
                        "Fourth Column Items Displayed on the screen",
                        style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                  
                      Text(
                        "Extra Items Approved on the screen",
                        style: TextStyle(color: ExitColors.pureBlack, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
            // ===============================COLUMN============================================
            
            
            
            
              ],
            ),
          ),



GestureDetector(onDoubleTap: (){

},child: Text("Tap"),)

// ===============================Row Widget ====================================




        ],
      ),

      backgroundColor: ExitColors.pureWhite,
    );
  }
}
