import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'dart:async';

import '../Inroduction Pages/begin.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});
  @override
  ScanQRPageState createState() => ScanQRPageState();
}

class ScanQRPageState extends State<ScanQRPage>
    with SingleTickerProviderStateMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  String result = '';
  late String idt = '';
  late String id = 'vide';
  late String utilise = '';
  late bool temp;
  late String serviceNom = '';
  late String servicePrix = '';

  Future<void> logout() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("UID");

    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BeginScreen(),
      ),
    );
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
      duration: const Duration(milliseconds: 350),
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

  Map<String, dynamic> data = {};
  Future<void> fetchData() async {
    final snapshot = await _firestore.collection('Etudiant').get();

    if (snapshot.docs.isEmpty) {
      await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
      return;
    }

    final futures = snapshot.docs.map((etudiantDoc) async {
      final srSnapshot =
          await etudiantDoc.reference.collection('SR').doc(id).get();

      if (srSnapshot.exists) {
        final ticketSnapshot = await _firestore
            .collection('Ticket')
            .where('id', isEqualTo: etudiantDoc.id)
            .orderBy('date', descending: true)
            .get();

        if (ticketSnapshot.docs.isNotEmpty) {
          final lastTicketDoc = ticketSnapshot.docs.first;
          final lastDate = lastTicketDoc['date'] as Timestamp;
          final lastDateFormat = lastDate.toDate().toUtc();
          final currentDate = DateTime.now().toUtc();
          final difference = currentDate.difference(lastDateFormat);

          setState(() {
            idt = srSnapshot['Id'] as String;
            utilise = srSnapshot['Utilise'] as String;
            serviceNom = srSnapshot['Nom'] as String;
            servicePrix = (srSnapshot['Prix'] as int).toString();
          });

          if (idt.isEmpty) {
            await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
          } else if (utilise == 'non') {
            if (serviceNom == 'Restaurant' &&
                difference < const Duration(minutes: 2)) {
              await _assetsAudioPlayer
                  .open(Audio('assets/sound/AccessDenied.mp3'));
              setState(() {
                temp = true;
              });
            } else {
              await _assetsAudioPlayer.open(Audio('assets/sound/success.mp3'));
              await srSnapshot.reference.update({'Utilise': 'oui'});
              if (serviceNom == 'Restaurant') {
                final ticketCollection = _firestore.collection('Ticket');
                await ticketCollection.add({
                  'id': etudiantDoc.id,
                  'date': Timestamp.now(),
                });
              }
            }
          } else {
            await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
          }
        } else {
          serviceNom = srSnapshot['Nom'] as String;
          if (serviceNom == 'Restaurant') {
            setState(() {
              idt = srSnapshot['Id'] as String;
              utilise = srSnapshot['Utilise'] as String;
              serviceNom = srSnapshot['Nom'] as String;
              servicePrix = (srSnapshot['Prix'] as int).toString();
            });

            if (idt.isEmpty) {
              await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
            } else if (utilise == 'non') {
              await _assetsAudioPlayer.open(Audio('assets/sound/success.mp3'));
              await srSnapshot.reference.update({'Utilise': 'oui'});
            } else {
              await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
            }

            final ticketCollection = _firestore.collection('Ticket');
            await ticketCollection.add({
              'id': etudiantDoc.id,
              'date': Timestamp.now(),
            });
          } else {
            setState(() {
              idt = srSnapshot['Id'] as String;
              utilise = srSnapshot['Utilise'] as String;
              serviceNom = srSnapshot['Nom'] as String;
              servicePrix = (srSnapshot['Prix'] as int).toString();
            });

            if (idt.isEmpty) {
              await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
            } else if (utilise == 'non') {
              await srSnapshot.reference.update({'Utilise': 'oui'});
              await _assetsAudioPlayer.open(Audio('assets/sound/success.mp3'));
            } else {
              await _assetsAudioPlayer.open(Audio('assets/sound/failure.mp3'));
            }
          }
        }
      }
    });

    await Future.wait(futures);
  }

  Widget buildShimmer(double width, double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2EDE7),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/images/QR Code-pana.png',
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Scan QR Code',
                        style: TextStyle(
                          fontFamily: 'EduSABeginner',
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (data.isNotEmpty) ...[
                        const Text(
                          'Détails de ticket',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nom du service',
                                    style: TextStyle(
                                      fontFamily: 'JosefinSans',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                    ),
                                  ),
                                  serviceNom.isNotEmpty
                                      ? Text(
                                          serviceNom,
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        )
                                      : buildShimmer(50, 10),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ID',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  idt.isNotEmpty
                                      ? Text(
                                          idt,
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        )
                                      : buildShimmer(100, 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Prix de service',
                          style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        servicePrix.isNotEmpty
                            ? Text(
                                servicePrix,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            : buildShimmer(50, 10),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Validation',
                          style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        utilise.isNotEmpty
                            ? Text(
                                utilise == 'non'
                                    ? temp == true
                                        ? 'Utiliser le ticket à un autre moment'
                                        : 'Validé'
                                    : 'Non Validé',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: utilise == 'non'
                                      ? (temp == true
                                          ? Colors.yellow
                                          : Colors.blue)
                                      : Colors.red,
                                ),
                              )
                            : buildShimmer(50, 10),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 12),
          child: FloatingActionBubble(
            // Menu items
            items: <Bubble>[
              Bubble(
                title: "Déconnexion",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.exit_to_app,
                titleStyle: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
                onPress: () {
                  _animationController!.reverse();
                  Future.delayed(const Duration(milliseconds: 400), () async {
                    logout();
                  });
                },
              ),
              Bubble(
                title: "Paramètres",
                iconColor: Colors.white,
                bubbleColor: Colors.blue,
                icon: Icons.settings,
                titleStyle: const TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
                onPress: () {
                  _animationController!.reverse();
                },
              ),
              Bubble(
                  title: "Scan LT",
                  iconColor: Colors.white,
                  bubbleColor: Colors.blue,
                  icon: Icons.qr_code,
                  titleStyle: const TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  onPress: () async {
                    _animationController!.reverse();
                    Future.delayed(const Duration(milliseconds: 400), () async {
                      setState(() {
                        data = {};
                        idt = '';
                        utilise = '';
                        showResults = true;
                        temp = false;
                        serviceNom = '';
                        servicePrix = '';
                      });
                      while (showResults) {
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
                              data = jsonDecode(result);
                              id = data['Id'] as String;
                              fetchData();
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
                titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
                onPress: () {
                  _animationController!.reverse();
                  Future.delayed(const Duration(milliseconds: 400), () async {
                    setState(() {
                      data = {};
                      idt = '';
                      utilise = '';
                      temp = false;
                      serviceNom = '';
                      servicePrix = '';
                    });
                    String qrResult = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.QR);
                    setState(() {
                      result = qrResult;
                      if (result.isNotEmpty) {
                        try {
                          data = jsonDecode(result);
                          id = data['Id'] as String;
                          fetchData();
                        } catch (e) {
                          print(
                              "An error occurred while decoding JSON or fetching data: $e");
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
