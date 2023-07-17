// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class ScanQRPage extends StatefulWidget {
//   @override
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   String result = '';

//   @override
//   Widget build(BuildContext context) {
//     String formattedResult = result.split(' ').join('\n');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan QR'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(
//               formattedResult,
//               style: TextStyle(fontSize: 18),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           String qrResult = await FlutterBarcodeScanner.scanBarcode(
//               '#ff6666', 'Cancel', true, ScanMode.QR);
//           setState(() {
//             result = qrResult;
//           });
//         },
//         child: Icon(Icons.qr_code),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'dart:convert';

// class ScanQRPage extends StatefulWidget {
//   @override
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   String result = '';

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = {};

//     if (result.isNotEmpty) {
//       try {
//         data = jsonDecode(result);
//       } catch (e) {
//         print('Error decoding JSON: $e');
//       }
//     }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan QR'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text('Id: ${data['Id']}'),
//           ),
//           ListTile(
//             title: Text('Service: ${data['serviceNom']}'),
//           ),
//           ListTile(
//             title: Text('Prix: ${data['servicePrix']}'),
//           ),
//           ListTile(
//             title: Text('Nom: ${data['nom']}'),
//           ),
//           ListTile(
//             title: Text('Téléphone: ${data['telephone']}'),
//           ),
//           ListTile(
//             title: Text('Crédit: ${data['credit']}'),
//           ),
//           ListTile(
//             title: Text('Valide: ${data['Valide']}'),
//           ),
//         ],
//       ),
//   floatingActionButton: FloatingActionButton(
//     onPressed: () async {
//       String qrResult = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       setState(() {
//         result = qrResult;
//       });
//     },
//     child: Icon(Icons.qr_code),
//   ),
// );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ScanQRPage extends StatefulWidget {
//   @override
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   String result = '';

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = {};
//     String Id = '';

//     if (result.isNotEmpty) {
//       try {
//         data = jsonDecode(result);
//       } catch (e) {
//         print('Error decoding JSON: $e');
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Scan QR'),
//           ),
//           body: Center(
//             child: Text('Error decoding QR code data.'),
//           ),
//         );
//       }
//     }

// return StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance
//       .collection('Etudiant')
//       .doc()
//       .collection('SR')
//       .snapshots(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       // bool isValid = snapshot.data!.docs.isNotEmpty;
//       final doc = snapshot.data!.docs.first;
//       Id = doc['Id'] as String;
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Scan QR'),
//         ),
//         body: ListView(
//           children: [
//             ListTile(
//               title: Text('Id: $Id'),
//             ),
//             ListTile(
//               title: Text('Service: ${data['serviceNom']}'),
//             ),
//             ListTile(
//               title: Text('Prix: ${data['servicePrix']}'),
//             ),
//             ListTile(
//               title: Text('Nom: ${data['nom']}'),
//             ),
//             ListTile(
//               title: Text('Téléphone: ${data['telephone']}'),
//             ),
//             ListTile(
//               title: Text('Crédit: ${data['credit']}'),
//             ),
//             // ListTile(
//             //   title: Text(
//             //     isValid ? 'Valide' : 'Invalide',
//             //     style: TextStyle(
//             //       color: isValid ? Colors.blue : Colors.red,
//             //       fontWeight: FontWeight.bold,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             String qrResult = await FlutterBarcodeScanner.scanBarcode(
//                 '#ff6666', 'Cancel', true, ScanMode.QR);
//             setState(() {
//               result = qrResult;
//             });
//           },
//           child: Icon(Icons.qr_code),
//         ),
//       );
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else {
//       return Center(child: CircularProgressIndicator());
//     }
//   },
// );

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collectionGroup('SR')
//           .where('Id', isEqualTo: "n2OVOPbcIhFNnJWLNAVj")
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Scan QR'),
//             ),
//             body: ListView.builder(
//               itemCount: snapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final doc = snapshot.data!.docs[index];
//                 String Id = doc['Id'] as String;
//                 // Add more fields here as needed
//                 return ListTile(
//                   title: Text('Id: $Id'),
//                 );
//               },
//             ),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ScanQRPage extends StatefulWidget {
//   @override
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = {};
//     String Id = '';

//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collectionGroup('SR')
//           .where('Id', isEqualTo: 'eWn85KtCrUvVF2AIg0VO')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
//           final doc = snapshot.data!.docs.first;
//           String Id = doc['Id'] as String;
//           String Nom = doc['Nom'] as String;
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Scan QR'),
//             ),
//             body: ListView(
//               children: [
//                 ListTile(
//                   title: Text('Id: $Id'),
//                   subtitle: Text('Nom: $Nom'),
//                 ),
//                 // other ListTiles here
//               ],
//             ),
//           );
//         } else {
//           return Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

//------------------------------------------------------------

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'dart:convert';

// class ScanQRPage extends StatefulWidget {
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late String id = '';
//   late String nom = '';

//   Future<void> fetchData() async {
//     final snapshot = await _firestore.collection('Etudiant').get();
//     if (snapshot.docs.isNotEmpty) {
//       final etudiantDocs = snapshot.docs;
//       for (final etudiantDoc in etudiantDocs) {
//         final srSnapshot = await etudiantDoc.reference
//             .collection('SR')
//             .doc('shV5wqxBMfwpLSId3lJm')
//             .get();
//         if (srSnapshot.exists) {
//           setState(() {
//             id = srSnapshot['Id'] as String;
//             nom = srSnapshot['Nom'] as String;
//           });
//           return;
//         }
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: id != null && nom != null
//           ? Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [],
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Id $id",
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Welcome $nom",
//                     style: TextStyle(fontSize: 24),
//                   ),
//                 ],
//               ),
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }
//------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'dart:convert';

// class ScanQRPage extends StatefulWidget {
//   @override
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   String result = '';

//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> data = {};

// if (result.isNotEmpty) {
//   try {
//     data = jsonDecode(result);
//   } catch (e) {
//     print('Error decoding JSON: $e');
//   }
// }
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan QR'),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             title: Text('Id: ${data['Id']}'),
//           ),
//           ListTile(
//             title: Text('Service: ${data['serviceNom']}'),
//           ),
//           ListTile(
//             title: Text('Prix: ${data['servicePrix']}'),
//           ),
//           ListTile(
//             title: Text('Nom: ${data['nom']}'),
//           ),
//           ListTile(
//             title: Text('Téléphone: ${data['telephone']}'),
//           ),
//           ListTile(
//             title: Text('Crédit: ${data['credit']}'),
//           ),
//           ListTile(
//             title: Text('Valide: ${data['Valide']}'),
//           ),
//         ],
//       ),
//   floatingActionButton: FloatingActionButton(
//     onPressed: () async {
//       String qrResult = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       setState(() {
//         result = qrResult;
//       });
//     },
//     child: Icon(Icons.qr_code),
//   ),
// );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'dart:convert';

// class ScanQRPage extends StatefulWidget {
//   @override
//   _ScanQRPageState createState() => _ScanQRPageState();
// }

// class _ScanQRPageState extends State<ScanQRPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   String result = '';
//   late String ids = '';
//   late String id = 'vide';
//   late String Utilise = '';

//   Map<String, dynamic> data = new Map<String, dynamic>();

//   Future<void> fetchData() async {
//     final snapshot = await _firestore.collection('Etudiant').get();
//     if (snapshot.docs.isNotEmpty) {
//       final etudiantDocs = snapshot.docs;
//       for (final etudiantDoc in etudiantDocs) {
//         final srSnapshot = await etudiantDoc.reference
//             .collection('SR')
//             .doc(id)
//             .get(); // Use the id variable here
//         if (srSnapshot.exists) {
//           setState(() {
//             ids = srSnapshot['Id'] as String;
//             Utilise = srSnapshot['Utilise'] as String;
//           });
//           if (Utilise == 'non') {
//             await srSnapshot.reference.update({'Utilise': 'oui'});
//           }
//           return;
//         }
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan QR'),
//       ),
//       body: ListView(
//         children: [
//           if (data.isNotEmpty) ...[
//             ListTile(
//               title: Text('Ids: $ids'),
//             ),
//             ListTile(
//               title: Text('Utilise: $Utilise'),
//             ),
//             ListTile(
//               title: Text('serviceNom: ${data['serviceNom']}'),
//             ),
//             ListTile(
//               title: Text('servicePrix: ${data['servicePrix']}'),
//             ),
//             ListTile(
//               title: Text('nom: ${data['nom']}'),
//             ),
//             ListTile(
//               title: Text('Téléphone: ${data['telephone']}'),
//             ),
//             ListTile(
//               title: Text('Crédit: ${data['credit']}'),
//             ),
//             ListTile(
//               title: Text(
//                 ids.isNotEmpty ? 'Existing' : 'Not Existing',
//                 style: TextStyle(
//                   color: ids.isNotEmpty ? Colors.blue : Colors.red,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 Utilise == 'non' ? 'validate' : 'Not validate',
//                 style: TextStyle(
//                   color: Utilise == 'non' ? Colors.blue : Colors.red,
//                 ),
//               ),
//             ),
//           ],
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           setState(() {
//             data = {};
//             ids = '';
//           });
//           String qrResult = await FlutterBarcodeScanner.scanBarcode(
//               '#ff6666', 'Cancel', true, ScanMode.QR);
//           setState(() {
//             result = qrResult;
//             if (result.isNotEmpty) {
//               try {
//                 data = jsonDecode(result);
//                 id = data['Id']
//                     as String; // Store the id field in the id variable
//                 fetchData(); // Call fetchData after setting the id variable
//               } catch (e) {
//                 print('Error decoding JSON: $e');
//               }
//             }
//           });
//         },
//         child: Icon(Icons.qr_code),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'dart:convert';
import 'package:universite_qr_code/Orientationpage.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage>
    with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  String result = '';
  late String ids = '';
  late String id = 'vide';
  late String Utilise = '';
  late bool temp;

  Future<void> logout() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("UID");

    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => Orientationpage(),
      ),
    );
  }

  Map<String, dynamic> data = new Map<String, dynamic>();
  Future<void> fetchData() async {
    final snapshot = await _firestore.collection('Etudiant').get();
    if (snapshot.docs.isNotEmpty) {
      final etudiantDocs = snapshot.docs;
      for (final etudiantDoc in etudiantDocs) {
        final srSnapshot = await etudiantDoc.reference
            .collection('SR')
            .doc(id)
            .get(); // Use the id variable here

        if (srSnapshot.exists) {
          // Retrieve the date from the Ticket collection
          final ticketSnapshot = await _firestore
              .collection('Ticket')
              .where('id', isEqualTo: etudiantDoc.id)
              .orderBy('date',
                  descending: true) // Sort by date in descending order
              .get();

          if (ticketSnapshot.docs.isNotEmpty) {
            final ticketDocs = ticketSnapshot.docs;
            final lastTicketDoc =
                ticketDocs.first; // Retrieve the last document

            final lastDate = lastTicketDoc['date'] as Timestamp;
            final lastDateFormat = lastDate.toDate().toUtc();
            final currentDate = DateTime.now().toUtc();
            final difference = currentDate.difference(lastDateFormat);

            setState(() {
              ids = srSnapshot['Id'] as String;
              Utilise = srSnapshot['Utilise'] as String;
            });

            if (ids.isEmpty) {
              await _assetsAudioPlayer.open(
                Audio('assets/failure.mp3'),
              );
            } else if (Utilise == 'non') {
              if (difference < const Duration(minutes: 2)) {
                await _assetsAudioPlayer.open(
                  Audio('assets/AccessDenied.mp3'),
                );
                setState(() {
                  temp = true;
                });
              } else {
                await srSnapshot.reference.update({'Utilise': 'oui'});
                await _assetsAudioPlayer.open(
                  Audio('assets/success.mp3'),
                );
                // Add the etudiantDoc.id and date to the Ticket collection
                final ticketCollection = _firestore.collection('Ticket');
                await ticketCollection.add({
                  'id': etudiantDoc.id,
                  'date': Timestamp.now(),
                });
              }
            } else {
              await _assetsAudioPlayer.open(
                Audio('assets/failure.mp3'),
              );
            }
            return;
          } else {
            // Add the etudiantDoc.id and date to the Ticket collection
            final ticketCollection = _firestore.collection('Ticket');
            await ticketCollection.add({
              'id': etudiantDoc.id,
              'date': Timestamp.now(),
            });

            setState(() {
              ids = srSnapshot['Id'] as String;
              Utilise = srSnapshot['Utilise'] as String;
            });

            if (ids.isEmpty) {
              await _assetsAudioPlayer.open(
                Audio('assets/failure.mp3'),
              );
            } else if (Utilise == 'non') {
              await srSnapshot.reference.update({'Utilise': 'oui'});
              await _assetsAudioPlayer.open(
                Audio('assets/success.mp3'),
              );
            } else {
              await _assetsAudioPlayer.open(
                Audio('assets/failure.mp3'),
              );
            }
          }
        }
      }
    } else {
      await _assetsAudioPlayer.open(
        Audio('assets/failure.mp3'),
      );
    }
  }

  Animation<double>? _animation;
  AnimationController? _animationController;

  bool showResults = false;
  @override
  void initState() {
    temp = false;
    super.initState();
    fetchData();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  void dispose() {
    showResults = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF2EDE7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/QR Code-pana.png',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Card(
                margin: EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scan QR Code',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      if (data.isNotEmpty) ...[
                        Text(
                          'Détails des services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nom du service',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '${data['serviceNom']}',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ID',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '$ids',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 14.0),
                                  Text(
                                    ids.isNotEmpty
                                        ? ''
                                        : 'Cette ticket n existe pas',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ids.isNotEmpty
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Prix de service',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${data['servicePrix']}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Validation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${Utilise == 'non' ? (temp == true ? 'Utiliser le ticket à un autre moment' : 'Validé')  : 'Non Validé'}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Utilise == 'non' ? (temp == true ? Colors.yellow : Colors.blue) : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 10, bottom: 12),
          child: FloatingActionBubble(
            // Menu items
            items: <Bubble>[
              Bubble(
                title: "Deconnection",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.exit_to_app,
                titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController!.reverse();
                  Future.delayed(Duration(milliseconds: 400), () async {
                    logout();
                  });
                },
              ),
              // Floating action menu item
              Bubble(
                title: "Paramètres",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.settings,
                titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController!.reverse();
                },
              ),
              Bubble(
                  title: "Scan LT",
                  iconColor: Colors.white,
                  bubbleColor: Colors.blue,
                  icon: Icons.qr_code,
                  titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                  onPress: () async {
                    _animationController!.reverse();
                    Future.delayed(Duration(milliseconds: 400), () async {
                      setState(() {
                        data = {};
                        ids = '';
                        Utilise = '';
                        showResults =
                            true; // Set showResults to true when the button is pressed
                        temp = false;
                      });
                      while (showResults) {
                        // Start a loop that runs as long as showResults is true
                        String qrResult =
                            await FlutterBarcodeScanner.scanBarcode(
                                '#ff6666', 'Cancel', true, ScanMode.QR);
                        if (qrResult == '-1') {
                          setState(() {
                            showResults = false;
                          });
                        } else {
                          setState(() {
                            result = qrResult;
                            if (result.isNotEmpty) {
                              try {
                                data = jsonDecode(result);
                                id = data['Id'] as String;
                                fetchData();
                              } catch (e) {
                                print('Error decoding JSON: $e');
                              }
                            }
                          });
                        }
                      }
                    });
                  }),
              Bubble(
                title: "Scan",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.qr_code,
                titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController!.reverse();
                  Future.delayed(Duration(milliseconds: 400), () async {
                    setState(() {
                      data = {};
                      ids = '';
                      Utilise = '';
                      temp = false;
                    });
                    String qrResult = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.QR);
                    setState(() {
                      result = qrResult;
                      if (result.isNotEmpty) {
                        try {
                          data = jsonDecode(result);
                          id = data['Id']
                              as String; // Store the id field in the id variable
                          fetchData(); // Call fetchData after setting the id variable
                        } catch (e) {
                          print('Error decoding JSON: $e');
                        }
                      }
                    });
                  });
                },
              ),
            ],

            // animation controller
            animation: _animation!,

            // On pressed change animation state
            onPress: () => _animationController!.isCompleted
                ? _animationController!.reverse()
                : _animationController!.forward(),

            // Floating Action button Icon color
            iconColor: Colors.blue,

            // Flaoting Action button Icon
            iconData: Icons.menu,
            backGroundColor: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
