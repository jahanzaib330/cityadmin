import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Dashboard.dart';
import 'Firebase_Firestore/Contact_Screen.dart';
import 'Firebase_Firestore/Customers/Customer_View_Screen.dart';
import 'Firebase_Firestore/Manage_Bookers/Manage_Booker_Screen.dart';
import 'Firebase_Firestore/Products/Product_Screen.dart';
import 'Logout_Screen.dart';
import 'Order_Booking_Screen.dart';
import 'Profile_Screen.dart';
import 'Track_Booker_Screen.dart';

class BookingStatus extends StatefulWidget {
  const BookingStatus({super.key});

  @override
  State<BookingStatus> createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Status" , style: GoogleFonts.palanquin(
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

    );
  }
}
