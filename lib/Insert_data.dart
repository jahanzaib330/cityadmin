import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    Future<void> insertrecord()async{
      if(name.text !="" || email.text != "" || password.text !=""){
        try{
          String uri = "http://localhost/City_Channel_Api/insert_record.php";
            var res = await http.post(Uri.parse(uri), body: {
              "name" : name.text,
              "email" : email.text,
              "password" : password.text
            });
            var response = jsonDecode(res.body);
            print(response);
            if(response["success"]=="true"){
              print("Record Insert");
            }
            else{
              print("Some Issues");
            }
        }
        catch(e){
          print(e);
        }
      } else{
        print("Please Fill The Field");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Data'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10) ,
            child: TextFormField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Enter Your Name")
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10) ,
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Your Email")
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10) ,
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter Your Password")
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: (){
                insertrecord();
              },
              child: Text("Insert"),
            ),
          )

        ],
      ),
    );
  }
}
