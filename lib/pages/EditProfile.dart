import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  final String? name;
  final String? contact;
  final String? gender;
  final String? emergencycontact;
  final String? Dob;
  //part of onSave Callback
  final void Function(Map<String,String> updated) onSave;

  const Editprofile({Key? key,
  this.name,
  this.contact,
  this.gender,
  this.emergencycontact,
  this.Dob,
  required this.onSave,
  }) : super(key: key);
  
  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _genderController = TextEditingController();
  final _emergencyController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _nameController.text = widget.name ?? "";
    _contactController.text = widget.contact ?? "";
    _genderController.text = widget.gender ?? "";
    _emergencyController.text = widget.emergencycontact ?? "";
  }

  @override
  void dispose(){
    _nameController.dispose();
    _genderController.dispose();
    _contactController.dispose();
    _emergencyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close)) 
        ],
      ),
      body: SingleChildScrollView(
        child: Form(child: 
        Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText:"Name"),
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _contactController,
              decoration: InputDecoration(labelText: 'Contact'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12,),
            DropdownButtonFormField<String>(
              value: null,
              items: ['Male', "Female"].map((gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (value){
                _genderController.text = value ?? '';
              },
              decoration: InputDecoration(labelText:"Gender")
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: _emergencyController,
              decoration: InputDecoration(labelText: "Emergency Contact"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(onPressed: (){
              final updated = <String, String> {
                "name": _nameController.text,
                "contact": _contactController.text,
                "gender": _genderController.text,
                "emergency_contact": _emergencyController.text,
                "Dob": widget.Dob ?? '',
              };
              widget.onSave(updated);
              Navigator.pop(context);
            },
            label: Text("Save"),
            icon: Icon(Icons.save),
            )
          ],
        ),
        ),
        ),
    );
  }
}