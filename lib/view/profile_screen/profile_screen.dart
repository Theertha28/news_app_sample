import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
        style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w700,
          fontSize: 25
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
  
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),

            Text(
              "John Doe",
              style:  GoogleFonts.urbanist(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "john.doe@email.com",
              style:  GoogleFonts.urbanist(fontSize: 16, color: Colors.grey.shade800),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
               
              },
              child: Text("Edit Profile",
                style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w700,
          
        )),
            ),
            SizedBox(height: 20),

        ListTile(
              leading: Icon(Icons.bookmark_border_outlined),
              title: Text("Saved",  style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w700,
   
        )),
              onTap: () {
             
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings",  style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w700,
   
        )),
              onTap: () {
      
              },
            ),
             
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout",  style: GoogleFonts.urbanist(
          fontWeight: FontWeight.w700,
   
        )),
              onTap: () {
             
              },
            ),
          ],
        ),
      ),
    );
  }
}
