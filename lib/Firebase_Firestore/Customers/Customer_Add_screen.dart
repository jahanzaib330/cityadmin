import 'dart:convert';

import 'package:cityadmin/Firebase_Firestore/Customers/Customer_Add_screen.dart';
import 'package:cityadmin/Firebase_Firestore/Customers/Customer_Upload_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Booking_Status_Screen.dart';
import '../../Dashboard.dart';
import '../../Logout_Screen.dart';
import '../../Order_Booking_Screen.dart';
import '../../Profile_Screen.dart';
import '../../Track_Booker_Screen.dart';
import '../Contact_Screen.dart';
import '../Manage_Bookers/Manage_Booker_Screen.dart';
import '../Products/Product_Screen.dart';
import 'Customer_View_Screen.dart';
import 'package:http/http.dart' as http;

class CustomerAdd extends StatefulWidget {
  const CustomerAdd({super.key});

  @override
  State<CustomerAdd> createState() => _CustomerAddState();
}

class _CustomerAddState extends State<CustomerAdd> {
  @override
  Widget build(BuildContext context) {
    TextEditingController bookercode = TextEditingController();
    TextEditingController customercode = TextEditingController();
    TextEditingController customername = TextEditingController();
    TextEditingController customeraddress = TextEditingController();

    Future<void> insertrecord() async {
      if(bookercode.text != "" || customercode.text != "" || customername.text != "" || customeraddress.text != "" ){
        try{
          String uri = "http://localhost/City_Channel_Api/Customers/Insert_Customer.php";

          var res = await http.post(Uri.parse(uri), body: {
            "bookercode" : bookercode.text,
            "customercode" : customercode.text,
            "customername" : customername.text,
            "customeraddress" : customeraddress.text
          });

          var responce = jsonDecode(res.body);
          print(responce);
          if(responce["success"] == "true"){
            print("Record Inserted");
            bookercode.text = "";
            customercode.text = "";
            customername.text = "";
            customeraddress.text = "";
          }else{
            print("Some Issues");
          }
        }
        catch(e){
          print(e);
        }
      }else{
        print("Please fill All fields");
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "Customer Manage",
          style: GoogleFonts.palanquin(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.blueAccent),
        ),
        backgroundColor: const Color(0xffffffff),
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.dehaze,
                  color: Color(0xf0000000),
                ));
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageBooker(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.manage_accounts),
                title: Text("Manage Bookers"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrackBooker(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.spatial_tracking_rounded),
                title: Text("Track Booker"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingStatus(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.signal_wifi_statusbar_4_bar),
                title: Text("Booking Status"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.production_quantity_limits_sharp),
                title: Text("Products Manage"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerView(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.people_rounded),
                title: Text("Customer manage"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderBooking(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.reorder_outlined),
                title: Text("Order Book"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile Page"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactScreen(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.contact_page_outlined),
                title: Text("Contact Page"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Logout(),
                    ));
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 250, top: 50),
                width: 900,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 300, top: 30),
                width: 800,
                height: 80,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Row(
                  children: [
                    Text(
                      "Customers:",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerView(),
                            ));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: new IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.view_agenda,
                                        color: Colors.white, size: 20)),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "View customer",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerAdd(),
                            ));
                      },
                      child: Row(
                        children: [
                          Container(
                              child: new IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.add,
                                      color: Colors.white, size: 20))),
                          Container(
                            child: Text(
                              "Add Customers",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerUpload(),
                            ));
                      },
                      child: Row(
                        children: [
                          Container(
                              child: new IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.upload,
                                      color: Colors.white, size: 20))),
                          Container(
                            child: Text(
                              "Upload Customers",
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 600, top: 130),
                width: 200,
                height: 100,
                child: Text("Add Customer", style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),),
              ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 370, top: 180),
                    width: 250,
                    child: TextField(
                      controller: bookercode,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Enter Booker Code',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 180),
                        width: 250,
                        child: TextField(
                          controller: customercode,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Enter Customer Code',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 370, top: 270),
                    width: 300,
                    child: TextField(
                      controller: customername,
                      decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Enter Customer Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 270),
                        width: 300,
                        child: TextField(
                          controller: customeraddress,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Enter Customer Address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      insertrecord();
                    },
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ,)),
                    child: Container(
                      margin: EdgeInsets.only(left: 600, top: 360),
                      padding: EdgeInsets.only(left: 20, top: 10),
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Add Customer",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}
