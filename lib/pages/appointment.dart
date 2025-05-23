/* 
Nakarin Phoorahong
6588070
*/


import 'package:flutter/material.dart';


class AppointmentP extends StatefulWidget {
  const AppointmentP({super.key});

  @override
  State<AppointmentP> createState() => _AppointmentPState();
}


class _AppointmentPState extends State<AppointmentP>  with TickerProviderStateMixin{

  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Details", style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          tabs: [
            Tab(icon: Icon(Icons.upcoming), text: "upcoming",),
            Tab(icon: Icon(Icons.done), text: "past",),
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            padding: const EdgeInsets.all(8),
            children: [
              AppointmentINFO(title: "Trauma Surgery", 
              date: DateTime(2025, 6, 20), 
              dname: "Max Goodwin", 
              DPname: "Crash Unit", 
              Loc: "Building 55A"),
              AppointmentINFO(
                title: "Clinical Testing", 
                date: DateTime(2025,6,25), 
                dname: 'Stephen Strange', 
                DPname: 'METAhuman', 
                Loc: 'Wayne Building')
            ],
          ),
        ListView(
            padding: const EdgeInsets.all(8),
            children: [
              AppointmentINFO(title: "Appointment", 
              date: DateTime(2024,5,25), 
              dname: "Fredrick Hige", 
              DPname: "Cardiology", 
              Loc: "Building F"),
              AppointmentINFO(
                title: 'Urgent Consultation', 
                date: DateTime(2020,1,20), 
                dname: "Gregory House", 
                DPname: "Internal Medicine", 
                Loc: "Joint-base Andrew")
        ],
        ),
        ],
      ),
      );
  
  }
}

// the class of card and information like task and task item
/*
information needed
// title of appointment; appointment or surgical or clinical testing
// date and time
// doctor name
// department name
// location

*/
class AppointmentINFO extends StatefulWidget {
  final String title;
  final String dname;
  final DateTime date;
  final String Loc;
  final String DPname;

  AppointmentINFO({super.key,required this.title,required this.date, required this.dname, required this.DPname, required this.Loc });

  @override
  State<AppointmentINFO> createState() => _AppointmentINFOState();
}

class _AppointmentINFOState extends State<AppointmentINFO> {
  bool isExpanded = false; // to keep track

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), 
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: (){
          setState(() {
            isExpanded = !isExpanded;
          });
        },  
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: 
        Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(widget.date.toLocal().toString().split(' ')[0], style: TextStyle(fontSize: 13),),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: Icon(isExpanded ? Icons.expand_less : Icons.expand_more_rounded),
            ),
          ],
          ),
          // only do if isExpanded is True and then put everything to list
          if (isExpanded) ...[
            const SizedBox(height: 12),
            const Divider(),
            Text("Doctor: ${widget.dname}"),
            Text("Date: ${widget.date.toLocal().toString().split(' ')[0]}"),
            Text("Department: ${widget.DPname}"),
            Text("Location: ${widget.Loc}"),
          ],
        ],
      ),
    ),
    ),
    );
  }
}
