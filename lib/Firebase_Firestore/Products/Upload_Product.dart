import 'dart:html';
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
import 'Product_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';

class UploadProduct extends StatefulWidget {
  const UploadProduct({super.key});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {


  @override
  Widget build(BuildContext context) {
    Future<void> _pickAndUploadFile() async{
      String? filePath = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      ).then((value) => value?.files.single.path);

      if(filePath != null){
        //Send the file to the php backend

        var url = "http://localhost/City_Channel_Api/Product/Insert_product.php";
        var request = http.MultipartRequest('Post' , Uri.parse(url));
        request.files.add(
          await http.MultipartFile.fromPath('excel' , filePath),
        );

        var responce = await request.send();
        if(responce.statusCode == 200){
          //Handle success
          print('File Uploaded Successfully');
        }else{
          // Handle failure
          print('Failed to upload file');
        }
      }
    }
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            "Upload Products",
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
        body: Column(children: [
          Stack(children: [
            Container(
              margin: EdgeInsets.only(left: 350, top: 50),
              width: 700,
              height: 280,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                    child: Row(
                      children: [
                        Container(
                            child: new IconButton(
                                onPressed: null,
                                icon: Icon(Icons.view_agenda,
                                    color: Colors.white, size: 20))),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
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
                  SizedBox(
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
            ElevatedButton(
              onPressed: _pickAndUploadFile,
              child: Text('Pick and Upload Excel File'),

            )

          ]),
        ]));
  }
}
