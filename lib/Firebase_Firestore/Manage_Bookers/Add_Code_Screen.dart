import 'dart:convert';

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
import '../Products/Product_Screen.dart';
import 'Add_Bookers_Screen.dart';
import 'Add_Code_Screen.dart';
import 'Manage_Booker_Screen.dart';
import 'View_Code.dart';
import 'package:http/http.dart' as http;

class AddCode extends StatefulWidget {
  const AddCode({super.key});

  @override
  State<AddCode> createState() => _AddCodeState();
}

class _AddCodeState extends State<AddCode> {
  @override
  Widget build(BuildContext context) {

    TextEditingController bookername = TextEditingController();
    TextEditingController bookercode = TextEditingController();

    Future<void> insertcode() async {
      if(bookercode.text != "" || bookername.text != "" ){
        try{
          String uri = "http://localhost/City_Channel_Api/insert_Code.php";

          var res = await http.post(Uri.parse(uri), body: {
            "bookername" : bookername.text,
            "bookercode": bookercode.text,

          });

          var responce = jsonDecode(res.body);
          print(responce);
          if(responce["success"] == "true"){
            print("Record Inserted");
            bookercode.text = "";
            bookername.text = "";
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
         "Add Bookers",
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
               margin: EdgeInsets.only(left: 200, top: 50),
               width: 1000,
               height: 400,
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20)),
             ),
             Container(
               padding: EdgeInsets.only(left: 10),
               margin: EdgeInsets.only(left: 300, top: 30),
               width: 750,
               height: 80,
               decoration: BoxDecoration(color: Colors.blueAccent),
               child: Row(
                 children: [
                   Text(
                     "Bookers:",
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
                             builder: (context) => ManageBooker(),
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
                                 "View Bookers",
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
                             builder: (context) => AddBookers(),
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
                             "Add Bookers",
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
                             builder: (context) => AddCode(),
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
                             "Add Code",
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
                             builder: (context) => ViewCode(),
                           ));
                     },
                     child: Row(
                       children: [
                         Container(
                             child: new IconButton(
                                 onPressed: null,
                                 icon: Icon(Icons.view_agenda,
                                     color: Colors.white, size: 20))),
                         Container(
                           child: Text(
                             "View Code",
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
               child: Text(
                 "Add Code",
                 style: GoogleFonts.poppins(
                   fontSize: 25,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),

             Row(
               children: [
                 Container(
                   margin: EdgeInsets.only(left: 370, top: 180),
                   width: 250,
                   child: TextField(
                     controller: bookername,
                     decoration: InputDecoration(
                         fillColor: Colors.grey.shade100,
                         filled: true,
                         hintText: 'Enter Booker Name',
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(10))),
                   ),
                 ),
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(left: 100, top: 180),
                       width: 300,
                       child: TextField(
                         controller: bookercode,
                         decoration: InputDecoration(
                             fillColor: Colors.grey.shade100,
                             filled: true,
                             hintText: 'Enter Code',
                             border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10))),
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
                     insertcode();
                   },
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ,)),
                   child: Container(
                     margin: EdgeInsets.only(left: 150, top: 360),
                     padding: EdgeInsets.only(left: 20, top: 10),
                     width: 150,
                     height: 50,
                     decoration: BoxDecoration(
                       color: Colors.blueAccent,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Text(
                       "Add Code",
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
