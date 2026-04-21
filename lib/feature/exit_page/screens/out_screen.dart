import 'package:flutter/material.dart';
import 'package:isp_exit_form_implementation/feature/exit_page/exit_theme.dart';

class OutScreen extends StatelessWidget {

  const OutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List item = ["pen","laptop","pencil","football","mobile"];
    return Scaffold(
      appBar: AppBar(
        title: Text('Title Page', style: TextStyle(color: ExitColors.blue)),
        centerTitle: true,
        backgroundColor: ExitColors.blue,

        // leading: IconButton(onPressed: (){

        // }, icon: Icon(Icons.menu)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_balance_outlined),
          ),
        ],
        elevation: 0.7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      
      ),
      
      body: Center(
        child: Container(

          decoration: BoxDecoration(
            color: ExitColors.blue,
            // border: Border.all(color: ExitColors.textHint),
            // borderRadius: BorderRadius.circular(40),
          ),
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 11),
        
          child: ListView.builder(
            itemCount: item.length,
            // scrollDirection: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemExtent: 70,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  title: Text("${item[index]}"),
                  subtitle: Text("This is a subtitle"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    print('Clicked ${item[index]}');
                  },
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: ExitColors.blue,
    );
  }
}
