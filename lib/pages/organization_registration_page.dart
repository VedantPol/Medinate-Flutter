import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrgReg extends StatefulWidget {
  @override
  State<OrgReg> createState() => _OrgRegState();
}

class _OrgRegState extends State<OrgReg> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
}
  TextEditingController orgname = TextEditingController();
  TextEditingController orgemail = TextEditingController();
  TextEditingController orgcontact = TextEditingController();
  TextEditingController orgadd = TextEditingController();
  TextEditingController orgsite = TextEditingController();
  TextEditingController orguser = TextEditingController();
  TextEditingController orgpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Register your organization',
                  style: TextStyle(
                      color: Color.fromARGB(255, 24, 21, 167),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Enter your Organization\'s details',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orgname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Organization Name',
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: DropdownButton(
            //       // Down Arrow Icon
            //       icon: const Icon(Icons.keyboard_arrow_down),
            //       items: const [
            //         DropdownMenuItem(child: Text("Public"), value: "Public"),
            //         DropdownMenuItem(child: Text("Private"), value: "Private"),
            //         DropdownMenuItem(child: Text("NGO"), value: "NGO")
            //       ],
            //       //items: _salutations.map((String item => DropdownMenuItem<String>(child: Text(item)), value: item)).toList(),
            //       value: _dropdownValue,
            //       onChanged: dropdownCallback,
            //   ),

            /*child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Organization Type',
                ),
              ),
            ),*/
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orgemail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ID',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orgcontact,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contact Number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orgadd,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orgsite,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Website',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: orguser,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Organization Username',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: orgpass,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    signUpWithEmailAndPassword(orguser.text, orgpass.text);
                  },
                )),
          ],
        ));
  }
}
