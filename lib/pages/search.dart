import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:medinate/pages/home_page.dart';
import 'package:medinate/pages/organization_registration_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
// getData(){
//   StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance.collection('Orgs').snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (snapshot.hasError)
//       return Text('Error: ${snapshot.error}');
//     if (!snapshot.hasData)
//       return Text('Loading...');
//     return ListView(
//       children: snapshot.data.documents.map((DocumentSnapshot document) {
//         return ListTile(
//           title: Text(document['title']),
//           subtitle: Text(document['subtitle']),
//         );
//       }).toList(),
//     );
//   },
// );
// StreamBuilder<DocumentSnapshot>(
//   stream: FirebaseFirestore.instance.collection('Orgs').doc('G7XzQA5fkCegyCTIRVbU').snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//     if (snapshot.hasError)
//       return Text('Error: ${snapshot.error}');
//     if (!snapshot.hasData)
//       return Text('Loading...');
//     return Text(snapshot.data?['title']);
//   },
// );
// }

  Widget build(BuildContext context) {
    //getData();
    var db = FirebaseFirestore.instance;

    db.collection("users").get().then((event) {
    for (var doc in event.docs) {
      if(doc.data() == blood)
      print("${doc.id} => ${doc.data()}");
    }
    // db.collection("cities").get().then(
    //   (res) => print("Successfully completed"),
    //   onError: (e) => print("Error completing: $e"),
    // );
});
    return Scaffold(
      appBar: AppBar(
          title: const Text("Blood Avalibility"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: (){
              _navigateToHomeScreen(context);
            },
          ),
        ),
    );
  
}
}
void _navigateToHomeScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  }
