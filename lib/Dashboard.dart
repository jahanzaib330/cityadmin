import 'package:cityadmin/Booking_Status_Screen.dart';
import 'package:cityadmin/Firebase_Firestore/Contact_Screen.dart';
import 'package:cityadmin/Firebase_Firestore/Manage_Bookers/Manage_Booker_Screen.dart';
import 'package:cityadmin/Firebase_Firestore/Products/Product_Screen.dart';
import 'package:cityadmin/Logout_Screen.dart';
import 'package:cityadmin/Order_Booking_Screen.dart';
import 'package:cityadmin/Profile_Screen.dart';
import 'package:cityadmin/Track_Booker_Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Firebase_Firestore/Customers/Customer_View_Screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard" , style: GoogleFonts.palanquin(
            fontSize: 25,
            fontWeight: FontWeight.w800,
            color: Colors.blueAccent
        ),),
        backgroundColor: const Color(0xffffffff),
        centerTitle: true,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          },icon: const Icon(Icons.dehaze, color: Color(0xf0000000),));
        },),

      ),

      drawer: Drawer(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
              },
              child: const ListTile(
                leading: Icon(Icons.dashboard),
                title:  Text("Dashboard"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ManageBooker() ,));
              },
              child: const ListTile(
                leading: Icon(Icons.manage_accounts),
                title:  Text("Manage Bookers"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackBooker(),));
              },
              child: const ListTile(
                leading: Icon(Icons.spatial_tracking_rounded),
                title:  Text("Track Booker"),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookingStatus(),));
              },
              child: const ListTile(
                leading: Icon(Icons.signal_wifi_statusbar_4_bar),
                title:  Text("Booking Status"),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
              },
              child: const ListTile(
                leading: Icon(Icons.production_quantity_limits_sharp),
                title:  Text("Products Manage"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerView(),));
              },
              child: const ListTile(
                leading: Icon(Icons.people_rounded),
                title:  Text("Customer manage"),
              ),
            ),
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => OrderBooking(),));
              },
              child: const ListTile(
                leading: Icon(Icons.reorder_outlined),
                title:  Text("Order Book"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
              },
              child: const ListTile(
                leading: Icon(Icons.person),
                title:  Text("Profile Page"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen(),));
              },
              child: const ListTile(
                leading: Icon(Icons.contact_page_outlined),
                title:  Text("Contact Page"),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Logout(),));
              },
              child: const ListTile(
                leading: Icon(Icons.logout),
                title:  Text("Logout"),
              ),
            ),
          ],
        ),
      ),

       //AppBar Closed


       body: SingleChildScrollView(
         physics: ScrollPhysics(),
         scrollDirection: Axis.vertical,

           child: Column(
             children: [
               SingleChildScrollView(
                 physics: ScrollPhysics(),
                 scrollDirection: Axis.vertical,
                 child:  Row(
                   children: [
                     GestureDetector(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                       },
                       child: Container(
                         padding: EdgeInsets.only(left: 55 , top: 50),
                         margin: EdgeInsets.only(left: 70 , top: 50),
                         width: 350,
                         height: 150,
                         decoration: BoxDecoration(
                             color: Colors.blueAccent,
                             borderRadius: BorderRadius.circular(10)
                         ),
                         child: Text("Dashboard Screen" ,style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w600,
                             fontSize: 25,
                             color: Colors.white
                         ),),
                       ),
                     ),
                     Row(
                       children: [
                         GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => ManageBooker(),));
                           },
                           child: Container(
                             padding: EdgeInsets.only(left: 80 , top: 50),
                             margin: EdgeInsets.only(left: 70 , top: 50),
                             width: 350,
                             height: 150,
                             decoration: BoxDecoration(
                                 color: Colors.blueAccent,
                                 borderRadius: BorderRadius.circular(10)
                             ),
                             child: Text("Manage Booker" ,style: GoogleFonts.poppins(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 25,
                                 color: Colors.white
                             ),),
                           ),
                         ),

                       ],
                     ),
                     Row(
                       children: [
                         GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => TrackBooker(),));
                           },
                           child: Container(
                             padding: EdgeInsets.only(left: 100 , top: 50),
                             margin: EdgeInsets.only(left: 70 , top: 50),
                             width: 350,
                             height: 150,
                             decoration: BoxDecoration(
                                 color: Colors.blueAccent,
                                 borderRadius: BorderRadius.circular(10)
                             ),
                             child: Text("Track Booker" ,style: GoogleFonts.poppins(
                                 fontWeight: FontWeight.w600,
                                 fontSize: 25,
                                 color: Colors.white
                             ),),
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               SizedBox(height: 20,),
               Row(
                 children: [
                   GestureDetector(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => BookingStatus(),));
                     },
                     child: Container(
                       padding: EdgeInsets.only(left: 60 , top: 50),
                       margin: EdgeInsets.only(left: 70 , top: 50),
                       width: 350,
                       height: 150,
                       decoration: BoxDecoration(
                           color: Colors.blueAccent,
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: Text("Booking Status" ,style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w600,
                           fontSize: 25,
                           color: Colors.white
                       ),),
                     ),
                   ),
                   Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                         },
                         child: Container(
                           padding: EdgeInsets.only(left: 80 , top: 50),
                           margin: EdgeInsets.only(left: 70 , top: 50),
                           width: 350,
                           height: 150,
                           decoration: BoxDecoration(
                               color: Colors.blueAccent,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Text("Product Manage" ,style: GoogleFonts.poppins(
                               fontWeight: FontWeight.w600,
                               fontSize: 25,
                               color: Colors.white
                           ),),
                         ),
                       ),

                     ],
                   ),
                   Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerView(),));
                         },
                         child: Container(
                           padding: EdgeInsets.only(left: 60 , top: 50),
                           margin: EdgeInsets.only(left: 70 , top: 50),
                           width: 350,
                           height: 150,
                           decoration: BoxDecoration(
                               color: Colors.blueAccent,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Text("Customer Manage" ,style: GoogleFonts.poppins(
                               fontWeight: FontWeight.w600,
                               fontSize: 25,
                               color: Colors.white
                           ),),
                         ),
                       ),

                     ],
                   ),

                 ],
               ),

               SizedBox(height: 20,),
               Row(
                 children: [
                   GestureDetector(
                     onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => OrderBooking(),));
                     },
                     child: Container(
                       padding: EdgeInsets.only(left: 55 , top: 50),
                       margin: EdgeInsets.only(left: 70 , top: 50),
                       width: 350,
                       height: 150,
                       decoration: BoxDecoration(
                           color: Colors.blueAccent,
                           borderRadius: BorderRadius.circular(10)
                       ),
                       child: Text("Order Book" ,style: GoogleFonts.poppins(
                           fontWeight: FontWeight.w600,
                           fontSize: 25,
                           color: Colors.white
                       ),),
                     ),
                   ),
                   Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
                         },
                         child: Container(
                           padding: EdgeInsets.only(left: 80 , top: 50),
                           margin: EdgeInsets.only(left: 70 , top: 50),
                           width: 350,
                           height: 150,
                           decoration: BoxDecoration(
                               color: Colors.blueAccent,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Text("Profile Page" ,style: GoogleFonts.poppins(
                               fontWeight: FontWeight.w600,
                               fontSize: 25,
                               color: Colors.white
                           ),),
                         ),
                       ),

                     ],
                   ),
                   Row(
                     children: [
                       GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => ContactScreen(),));
                         },
                         child: Container(
                           padding: EdgeInsets.only(left: 100 , top: 50),
                           margin: EdgeInsets.only(left: 70 , top: 50),
                           width: 350,
                           height: 150,
                           decoration: BoxDecoration(
                               color: Colors.blueAccent,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Text("Contact us" ,style: GoogleFonts.poppins(
                               fontWeight: FontWeight.w600,
                               fontSize: 25,
                               color: Colors.white
                           ),),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ],
           ),
       )
    );
  }
}
