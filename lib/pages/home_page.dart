import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:medinate/pages/donation_page.dart';
import 'package:medinate/pages/registration_page.dart';
import 'package:medinate/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
var blood;
var place;
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: const Text("Medinate.com"),
          leading: IconButton(
            icon: Image.asset(
              'images/medinate.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            onPressed: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        child: ListView(children: [
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: const ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"],
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Blood Group",
              ),
            ),
            onChanged: (newValue) {
              setState(() {
                blood = newValue;
              });
            },
            selectedItem: "A+",
          ),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSelectedItems: true,
              disabledItemFn: (String s) => s.startsWith('I'),
            ),
            items: const [
              "Mumbai",
              "Pune",
              "Delhi",
              "Patna",
              "Chennai",
              "Ratnagiri"
            ],
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Location",
              ),
            ),
            onChanged: (newValue) {
              setState(() {
                place = newValue;
              });
            },
            selectedItem: "Pune",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.red,
              ),
              onPressed: () {
                _navigateToDonateScreen(context);
              },
              child: const Text('Search Blood near you'),
            ),
          ),
         
          CarouselSlider(
            items: [
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: ExactAssetImage('assets/images/poster1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: ExactAssetImage('assets/images/poster2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: ExactAssetImage('assets/images/poster3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 380.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ]),
        
      ),
      

      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  _navigateToNextScreen(context);
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  child: Center(
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Material(
              color: Color.fromARGB(255, 12, 129, 57),
              child: InkWell(
                onTap: () {
                  _navigateToDonationPageScreen(context);
                },
                child: const SizedBox(
                  height: kToolbarHeight,
                  child: Center(
                    child: Text(
                      'Donate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    
  }
}

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => TabBarDemo()));
}

void _navigateToDonateScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SearchBox()));
}

void _navigateToDonationPageScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DonationPage()));
}
