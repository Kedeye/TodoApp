
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/widget/widget.dart';
import '../addtach/addpage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<DocumentSnapshot> data = [];

  Future<List<DocumentSnapshot>> fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('tach').get();
    return querySnapshot.docs;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((result) {
      setState(() {
        data = result;
      });
    });
  }

  String formatDate(Timestamp date) {
    DateTime dateTime = date.toDate();
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 30, right: 25, top: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/Ellipse 1.png'),
                ),
                SizedBox(width: 8),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bonjour',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10),
                  child: Image.asset('assets/images/Group 1.png'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18),
                Center(
                  child: BuildRecharechTextField(
                    hintText: 'Taper le nom d’une tâche',
                  ),
                ),
                SizedBox(height: 15),
                reusableText('Mes tâches', fontSize: 16),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      BuildContainer(
                        text: 'En progres',
                        isSelected: selectedIndex == 0,
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      BuildContainer(
                        text: 'A faire',
                        isSelected: selectedIndex == 1,
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      BuildContainer(
                        text: 'Terminer',
                        isSelected: selectedIndex == 2,
                        onTap: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: data.isNotEmpty
                      ? Column(
                          children: data.asMap().entries.map((entry) {
                            int index = entry.key;
                            DocumentSnapshot document = entry.value;

                            return Column(
                              children: <Widget>[
                                BuildCard(
                                  type: document['type'],
                                  titre: document['titre'],
                                  etat: document['etat'],
                                  avancement:
                                      document['avancement']?.toDouble(),
                                  dateDebut: formatDate(document['dateDebut']),
                                  dateFin: formatDate(document['dateFin']),
                                ),
                                if (index < data.length - 1)
                                  SizedBox(height: 10),
                              ],
                            );
                          }).toList(),
                        )
                      : CircularProgressIndicator(),
                ),
              ],
            ),
            Positioned(
              bottom: 45,
              right: 16,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPage()),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
