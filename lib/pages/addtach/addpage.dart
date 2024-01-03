import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/widget/widget.dart';
import '../home/home.dart';


class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? type;
  String? etat;
  String? titre;
  String? dateDebut;
  String? dateFin;
  double? avancement;

  void addTaskToFirestore() async {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tach');

    Timestamp? debutTimestamp, finTimestamp;
    if (dateDebut != null) {
      debutTimestamp = Timestamp.fromDate(
        DateFormat('dd/MM/yy').parse(dateDebut!),
      );
    }
    if (dateFin != null) {
      finTimestamp = Timestamp.fromDate(
        DateFormat('dd/MM/yy').parse(dateFin!),
      );
    }
    // Add data to Firestore
    await tasks.add({
      'type': type,
      'etat': etat,
      'titre': titre,
      'dateDebut': debutTimestamp,
      'dateFin': finTimestamp,
      'avancement': avancement,
    });
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            reusableText('Creer une nouvelle tâche'),
            SizedBox(
              height: 20,
            ),
            reusableText('Type'),
            Center(
              child: BuildCustomDropdown(
                hintText: '',
                index: 1,
                onItemSelected: (value) {
                  setState(() {
                    type = value ?? '';
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            reusableText('Titre'),
            Center(
              child: BuildTextField(
                hintText: '',
                onValueChanged: (value) {
                  titre = value;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Date de debut',
                            margin: EdgeInsets.only(left: 0, bottom: 8)),
                        BuildTextField(
                          hintText: '',
                          textType: TextInputType.phone,
                          onValueChanged: (value) {
                            dateDebut = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Date de fin',
                            margin: EdgeInsets.only(left: 0, bottom: 8)),
                        BuildTextField(
                          hintText: '',
                          onValueChanged: (value) {
                            dateFin = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Etat',
                            margin: EdgeInsets.only(left: 0, bottom: 8)),
                        Center(
                          child: BuildCustomDropdown(
                            hintText: '',
                            index: 2,
                            onItemSelected: (value) {
                              setState(() {
                                etat = value ?? '';
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Avancement',
                            margin: EdgeInsets.only(left: 0, bottom: 8)),
                        BuildTextField(
                          hintText: '',
                          onValueChanged: (value) {
                            avancement = double.tryParse(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Center(
              child: buildLogInAndRegButton('Creer une tâche', () {
                addTaskToFirestore();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
