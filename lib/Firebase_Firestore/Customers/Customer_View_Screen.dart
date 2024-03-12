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
import 'package:http/http.dart' as http;

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {

  List userdata = [];
  Future<void> editrecord() async{

  }
  Future<void>delrecord( String Id) async{
    try{
      String uri = "http://localhost/City_Channel_Api/Customers/delete_customer.php";
      var res = await http.post(Uri.parse(uri),body: {"Id": Id});
      var response = jsonDecode(res.body);
      if(response["success"]=="true"){
        print("Record Deleted");
        getrecord();
      }
      else{
        print("Some Issue");
      }

    }
    catch(e){
      {print(e);}

    }

  }

  Future<void>getrecord() async {
    String uri = "http://localhost/City_Channel_Api/Customers/View_Customer.php";
    try{
      var response = await http.get(Uri.parse(uri));

      setState(() {
        userdata = jsonDecode(response.body);
      });
    }
    catch(e)
    {
      print(e);
    }
  }
  @override
  void initState() {
    getrecord();
    super.initState();
    // Add code after super

  }
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only( top: 50),
                  width: 1500,
                  height: 20000,
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
                  margin: EdgeInsets.only(left: 170, top: 120),
                  child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text('Booker code '),
                        ),
                        DataColumn(
                          label: Text('Customer code'),
                        ),
                        DataColumn(
                          label: Text('Customer Name'),
                        ),
                        DataColumn(
                          label: Text('Customer Address'),
                        ),
                        DataColumn(
                          label: Text('Edit'),
                        ),
                        DataColumn(
                          label: Text('Delete'),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        userdata.length,
                            (index) => DataRow(
                          cells: <DataCell>[
                            DataCell(Text(userdata[index]["Booker_code"] ?? "")),
                            DataCell(Text(userdata[index]["Customer_Code"]?? "")),
                            DataCell(Text(userdata[index]["Customer_Name"]?? "")),
                            DataCell(Text(userdata[index]["Customer_Address"]?? "")),
                            DataCell(IconButton(icon: Icon(Icons.edit), onPressed: (){
                              editrecord();
                            },)),
                            DataCell(IconButton(icon: Icon(Icons.delete), onPressed: (){
                              delrecord(userdata[index]["Id"]);
                            },))
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
