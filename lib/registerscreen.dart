// ignore_for_file: prefer_const_constructors, unused_import, prefer_interpolation_to_compose_strings
// ignore_for_file: use_key_in_widget_constructors,
// ignore_for_file: sort_child_properties_last, use_build_context_synchronously,
// ignore_for_file: depend_on_referenced_packages
// ignore_for_file: prefer_const_constructors_in_immutables,
// ignore_for_file: non_constant_identifier_names,
// ignore_for_file: unnecessary_string_interpolations
// ignore_for_file: must_be_immutable
// ignore_for_file: avoid_unnecessary_containers
// ignore_for_file: camel_case_types
// ignore_for_file: sized_box_for_whitespace
// ignore_for_file: dead_code,
// ignore_for_file: unused_label
// ignore_for_file: file_names
// ignore_for_file: avoid_print
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universite_qr_code/scanqr.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ScrollController scrollController = ScrollController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late double screenHeight;
  late double screenWidth;
  late double bottom;
  late String _uid;

  String otpPin = " ";
  String countryDial = "+222";
  String verID = " ";
  bool showLoading = false;

  int screenState = 0;

  Color blue = const Color(0xff8cccff);

  Future<void> verifyPhone(String number) async {
    setState(() {
      showLoading = true;
    });

    // Remove country code from phone number
    final phoneNumWithoutCode = number;

    // Query Firestore collection for matching phone number
    final query = await FirebaseFirestore.instance
        .collection('Employee')
        .where('Telephone', isEqualTo: phoneNumWithoutCode)
        .get();

    if (query.docs.isNotEmpty) {
      // Phone number found in Firestore, proceed with authentication
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) {
          showSnackBarText("Auth Completed!");
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            showLoading = false;
          });
          showSnackBarText("Auth Failed!");
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            showLoading = false;
          });
          showSnackBarText("Le code a été envoyé !");
          verID = verificationId;
          setState(() {
            screenState = 1;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          showSnackBarText("Timeout!");
        },
      );
    } else {
      // Phone number not found in Firestore
      setState(() {
        showLoading = false;
      });
      showSnackBarText("Numéro introuvable!");
    }
  }

  Future<void> verifyOTP() async {
    setState(() {
      showLoading = true;
    });
    if (otpPin.length < 6) {
      showSnackBarText("Enter OTP correctly!");
      return;
    }

    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin,
      ),
    )
        .then((UserCredential userCredential) async {
      _uid = userCredential.user!.uid;
      setState(() {
        showLoading = false;
      });
      // Save UID to SharedPreferences
      final sharedPref = await SharedPreferences.getInstance();
      sharedPref.setString("UID", _uid);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ScanQRPage(),
        ),
      );
    }).catchError((error) {
      showSnackBarText(error.message);
    }).whenComplete(() {});
    setState(() {
      showLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      onWillPop: () {
        setState(() {
          screenState = 0;
        });
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: CircleAvatar(
              backgroundColor: Color(0xff8cccff),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: blue,
        body: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight / 8),
                  child: Column(
                    children: [
                      Text(
                        "REJOIGNEZ",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth / 8,
                        ),
                      ),
                      Text(
                        "Enregistrez ton compte!",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: screenWidth / 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: circle(5),
              ),
              Transform.translate(
                offset: const Offset(30, -30),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: circle(4.5),
                ),
              ),
              Center(
                child: circle(3),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  height: bottom > 0 ? screenHeight : screenHeight / 2,
                  width: screenWidth,
                  color: Colors.white,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth / 12,
                      right: screenWidth / 12,
                      top: bottom > 0 ? screenHeight / 12 : 0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        screenState == 0 ? stateRegister() : stateOTP(),
                        GestureDetector(
                          onTap: () {
                            if (screenState == 0) {
                              if (phoneController.text.isEmpty) {
                                showSnackBarText(
                                    "Phone number is still empty!");
                              } else {
                                verifyPhone(countryDial + phoneController.text);
                              }
                            } else {
                              if (otpPin.length >= 6) {
                                verifyOTP();
                              } else {
                                showSnackBarText("Enter OTP correctly!");
                              }
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 50,
                                width: screenWidth,
                                margin:
                                    EdgeInsets.only(bottom: screenHeight / 12),
                                decoration: BoxDecoration(
                                  color: blue,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: (showLoading)
                                      ? const SizedBox(
                                          width: 40,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 4,
                                          ))
                                      : Text(
                                          "CONTINUE",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.5,
                                            fontSize: 18,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
          textColor: Colors.white,
        ),
      ),
    );
  }

  Widget stateRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Telephone",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        IntlPhoneField(
          controller: phoneController,
          showCountryFlag: false,
          showDropdownIcon: false,
          initialValue: countryDial,
          onCountryChanged: (country) {
            setState(() {
              countryDial = "+" + country.dialCode;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget stateOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "We just sent a code to ",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: countryDial + phoneController.text,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: "\nEntrez le code ici et nous pouvons continuer!",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        PinCodeTextField(
          appContext: context,
          length: 6,
          onChanged: (value) {
            setState(() {
              otpPin = value;
            });
          },
          pinTheme: PinTheme(
            activeColor: blue,
            selectedColor: blue,
            inactiveColor: Colors.black26,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Vous n'avez pas reçu le code? ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      screenState = 0;
                    });
                  },
                  child: Text(
                    "Renvoyer",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
