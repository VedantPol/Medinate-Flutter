import 'package:flutter/material.dart';
import 'package:medinate/pages/organization_registration_page.dart';
import 'blood_drive_registration_page.dart';
import 'donor_registration_page.dart';
import 'package:medinate/pages/home_page.dart';

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Donor Registration",
                    icon: Icon(Icons.attribution),
                  ),
                  Tab(
                    text: "Organization Registration",
                    icon: Icon(Icons.business),
                  ),
                  Tab(
                    text: "Register VBD camp",
                    icon: Icon(Icons.chalet),
                  ),
                ],
              ),
              centerTitle: true,
              title: const Text('Registration Page'),
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  _navigateToHomeScreen(context);
                },
              )),
          body: TabBarView(
            children: [
              DonorReg(),
              OrgReg(),
              CampaignReg(),
            ],
          ),
        ),
      ),
    );
  }
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => HomePage()));
}
