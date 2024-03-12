import 'dart:convert';

import 'package:cityadmin/Firebase_Firestore/Products/Upload_Product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Booking_Status_Screen.dart';
import '../../Dashboard.dart';
import '../../Logout_Screen.dart';
import '../../Order_Booking_Screen.dart';
import '../../Profile_Screen.dart';
import '../../Track_Booker_Screen.dart';
import '../Contact_Screen.dart';
import '../Customers/Customer_View_Screen.dart';
import '../Manage_Bookers/Manage_Booker_Screen.dart';
import 'Add_Products.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  List userdata = [];

  Future<void> editrecord() async{

  }
  Future<void>delrecord( String Id) async{
    try{
      String uri = "http://localhost/City_Channel_Api/Product/Delete_Product.php";
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
    String uri = "http://localhost/City_Channel_Api/Product/View_Product.php";
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
          "Product Manage",
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
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 150, top: 50),
                  width: 1150,
                  height: 20000,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  margin: EdgeInsets.only(left: 370, top: 30),
                  width: 650,
                  height: 80,
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  child: Row(
                    children: [
                      Text(
                        "Products:",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(),
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
                                            color: Colors.white, size: 20))),
                                SizedBox(
                                  width: 1,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "View Product",
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
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddProducts(),
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
                                "Add Products",
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                     const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadProduct(),
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
                                "Upload Product",
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
                          label: Text('Product Code '),
                        ),
                        DataColumn(
                          label: Text('Product Name'),
                        ),
                        DataColumn(
                          label: Text('Product Packing'),
                        ),
                        DataColumn(
                          label: Text('Product Price'),
                        ),
                        DataColumn(
                          label: Text('Product Quantity'),
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
                            DataCell(Text(userdata[index]["Product_Code"] ?? "")),
                            DataCell(Text(userdata[index]["Product_Name"]?? "")),
                            DataCell(Text(userdata[index]["Product_Packing"]?? "")),
                            DataCell(Text(userdata[index]["Product_Price"]?? "")),
                            DataCell(Text(userdata[index]["Product_Quantity"]?? "")),
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
