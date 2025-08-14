import 'package:flutter/material.dart';

class CityPage extends StatelessWidget {
  const CityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("London",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text("Updated at : 12:45",style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),
            Row(
              children: [
                // NetworkImage("url"),
                Text("20"),
                SizedBox(width: 20),
                Column(
                  children: [
                    Row(
                      children: [

                        Text("1281288128"),
                        SizedBox(width: 20),
                        Text("sdfsdfsdf")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ), 
        
      ),
      
    );
  }
}
