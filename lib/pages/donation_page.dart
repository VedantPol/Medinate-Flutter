import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'home_page.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donate Blood"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            _navigateToHomeScreen(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 25,
        ),
        child: DropdownSearch<String>(
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
          onChanged: print,
          selectedItem: "Pune",
        ),
      ),
    );
  }
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const HomePage(),
    ),
  );
}
