/* 
Nakarin Phoorahong
6588070
*/
import 'package:flutter/material.dart';
import 'package:itcs424_assignment_6588070/pages/EditProfile.dart';
class Patientprofile extends StatefulWidget {
  const Patientprofile({super.key});

  @override
  State<Patientprofile> createState() => _PatientprofileState();
}
class _PatientprofileState extends State<Patientprofile> {
  var currentName = 'Eric Tao';
  var currentContact = '+44 7000 800591';
  var currentGender = 'Male';
  var currentEmergencyContact = '+44 7700 900123 Harper';
  var currentHn = '99850/12';
  var currentDob = "21/01/1970";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      body: 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/pics/EricTao.jpeg'),
            ),
            SizedBox(height: 8,),
            Text("$currentName", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_hospital_sharp, color: Colors.deepOrange,),
                SizedBox(height: 6,),
                Text.rich(
                  TextSpan(
                    text: 'H/N:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: ' $currentHn',
                        style: TextStyle(fontWeight: FontWeight.normal)
                      )
                    ]
                    )
                    )
              ],
            ),
          SizedBox(height: 10),
          Row( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today, color: Colors.black, size: 20),
              SizedBox(width: 6),
              Text.rich(
                TextSpan(
                  text: 'Date of Birth: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ' $currentDob',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.male, color: Colors.black, size: 20),
              Icon(Icons.female, color: Colors.black, size: 20),
              SizedBox(width: 6),
              Text.rich(
                TextSpan(
                  text: 'Gender: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ' $currentGender',
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ),
              Icon(Icons.male, color: Colors.black, size: 20),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.call_made),
            SizedBox(width: 6),
            Text.rich(
              TextSpan(
                text: "Mobile: ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "$currentContact",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal)
                  )
                ]
              )
            )
          ],),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.red, size: 20),
              SizedBox(width: 6),
              Text.rich(
                TextSpan(
                  text: 'Emergency Contact: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                  children: [
                    TextSpan(
                      text: '$currentEmergencyContact',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // floating button for edit page
        ],
      ),
      ),
      // using onSave Callback
      // with gpt help
      floatingActionButton: ElevatedButton.icon(onPressed: () {
            Navigator.push(context, 
            MaterialPageRoute(builder: (_) => Editprofile(
              name: currentName,
              contact: currentContact,
              Dob: currentDob,
              gender: currentGender,
              emergencycontact: currentEmergencyContact,
              onSave: (updated)     {
              setState(() {
                currentName = updated['name'] ?? currentName;
                currentContact = updated['contact'] ?? currentContact;
                currentDob = updated['Dob'] ?? currentDob;
                currentGender = updated['gender'] ?? currentGender;
                currentEmergencyContact = updated['emergency_contact'] ?? currentEmergencyContact;
              });
            },
            )
            )
            );


          }, 
          label: Text("EDIT",style: TextStyle( color: Colors.blueAccent),),
          icon: Icon(Icons.edit),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.yellowAccent,
            iconColor: Colors.blue,
            backgroundColor: Colors.pink[100]
          ),
      ),
    );
  }
}