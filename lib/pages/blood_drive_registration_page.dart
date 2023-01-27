import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CampaignReg extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
}
  TextEditingController campname = TextEditingController();
  TextEditingController campaddress = TextEditingController();
  TextEditingController campdate = TextEditingController();
  TextEditingController participants = TextEditingController();
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
                  'Register your campaign',
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 167, 63),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: campname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Camp Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: campaddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Camp Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: campdate,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: participants,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expected Participants',
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
                  child: const Text('Register'),
                  onPressed: () {
                    signInWithEmailAndPassword(orguser.text, orgpass.text);
                    print("Log in successful");
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}
