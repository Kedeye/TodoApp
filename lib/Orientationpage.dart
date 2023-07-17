// import 'package:flutter/material.dart';
// import 'package:university/Login/registerscreen.dart';
// import 'package:university/Login/registerscreentwo.dart';

// class Orientationpage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/pip.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               'assets/Student (53).png',
//               height: screenHeight * 0.7,
//               width: screenWidth * 0.7,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.05,
//             left: screenWidth * 0.05,
//             child: SizedBox(
//               height: screenHeight * 0.45,
//               width: screenWidth * 0.45,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Bienvenue',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'cursive',
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Services',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'fantasy',
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Université',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'fantasy',
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   Text(
//                     'Services universitaires Ce sont les services disponibles à luniversité',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'sans serif',
//                       fontSize: screenWidth * 0.03,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: screenHeight * 0.05,
//             left: screenWidth * 0.05,
//             child: SizedBox(
//               height: screenHeight * 0.4,
//               width: screenWidth * 0.3,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RegisterScreen(),
//                     ),
//                   );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                         vertical: screenHeight * 0.020,
//                         horizontal: screenWidth * 0.05,
//                       ),
//                     ),
//                     child: SizedBox(
//                       width: screenWidth * 0.3,
//                       child: Text(
//                         'Etudiant',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontFamily: 'Lato',
//                           fontSize: screenWidth * 0.04,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RegisterScreenTwo(),
//                     ),
//                   );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.white,
//                       onPrimary: Colors.black,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                         vertical: screenHeight * 0.020,
//                         horizontal: screenWidth * 0.05,
//                       ),
//                     ),
//                     child: SizedBox(
//                       width: screenWidth * 0.3,
//                       child: Text(
//                         'Employee',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontFamily: 'Lato',
//                           fontSize: screenWidth * 0.04,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:university/Login/registerscreentwo.dart';

// class Orientationpage extends StatefulWidget {
//   @override
//   _OrientationpageState createState() => _OrientationpageState();
// }

// class _OrientationpageState extends State<Orientationpage> {
//   bool _isButtonPressed = false;
//   bool _isButtonPressed2 = false;

//   void _animateButton2() {
//     setState(() {
//       _isButtonPressed2 = true;
//     });
//     Future.delayed(Duration(milliseconds: 100), () {
//       setState(() {
//         _isButtonPressed2 = false;
//       });
//       Future.delayed(Duration(milliseconds: 500), () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => RegisterScreenTwo(),
//           ),
//         );
//       });
//     });
//   }

//   void _animateButton() {
//     setState(() {
//       _isButtonPressed = true;
//     });
//     Future.delayed(Duration(milliseconds: 100), () {
//       setState(() {
//         _isButtonPressed = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/pip.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               'assets/Student (53).png',
//               height: screenHeight * 0.7,
//               width: screenWidth * 0.7,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.05,
//             left: screenWidth * 0.05,
//             child: SizedBox(
//               height: screenHeight * 0.45,
//               width: screenWidth * 0.45,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Bienvenue',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'cursive',
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Services',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'fantasy',
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Université',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'fantasy',
//                       fontSize: screenWidth * 0.08,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   Text(
//                     'Services universitaires Ce sont les services disponibles à luniversité',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'sans serif',
//                       fontSize: screenWidth * 0.03,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: screenHeight * 0.05,
//             left: screenWidth * 0.05,
//             child: SizedBox(
//               height: screenHeight * 0.4,
//               width: screenWidth * 0.3,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   GestureDetector(
//                     onTapDown: (details) {
//                       setState(() {
//                         _isButtonPressed2 = true;
//                       });
//                     },
//                     onTapUp: (details) {
//                       setState(() {
//                         _isButtonPressed2 = false;
//                       });
//                       _animateButton2();
//                     },
//                     onTapCancel: () {
//                       setState(() {
//                         _isButtonPressed2 = false;
//                       });
//                     },
//                     child: AnimatedContainer(
//                       duration: Duration(milliseconds: 100),
//                       transform: Matrix4.identity()
//                         ..scale(_isButtonPressed2 ? 0.9 : 1.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           _animateButton2();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           onPrimary: Colors.black,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                             vertical: screenHeight * 0.020,
//                             horizontal: screenWidth * 0.05,
//                           ),
//                         ),
//                         child: SizedBox(
//                           width: screenWidth * 0.3,
//                           child: Text(
//                             'Etudiant',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontFamily: 'Lato',
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//============================================================================================
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:universite_qr_code/registerscreen.dart';

class Orientationpage extends StatefulWidget {
  @override
  _OrientationpageState createState() => _OrientationpageState();
}

class _OrientationpageState extends State<Orientationpage> {
  bool _isButtonPressed = false;

  void _animateButton3() {
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              RegisterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 400),
          reverseTransitionDuration: Duration(milliseconds: 300),
          barrierColor: Colors.black.withOpacity(0.5),
          barrierDismissible: false,
          opaque: false,
        ),
      );
    });
  }

  void _animateButton() {
    setState(() {
      _isButtonPressed = true;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _isButtonPressed = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _isButtonPressed = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Services.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight * 0.6,
              width: screenHeight * 0.5,
              child: Image.asset(
                'assets/Sidi Afelwat (1)-PhotoRoom.png',
                height: screenHeight * 0.5,
                width: screenWidth * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.01,
            left: screenWidth * 0.05,
            child: SizedBox(
              height: screenHeight * 0.45,
              width: screenWidth * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenue',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'fantasy',
                      fontSize: screenWidth * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Services',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'fantasy',
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Université',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'fantasy',
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Ceci est une version de l application "Services Universitaires" , qui est une version pour les employes',
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontFamily: 'sans serif',
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.05,
            child: SizedBox(
              height: screenHeight * 1.2,
              width: screenWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _isButtonPressed = true;
                      });
                    },
                    onTapUp: (details) {
                      setState(() {
                        _isButtonPressed = false;
                      });
                      _animateButton();
                    },
                    onTapCancel: () {
                      setState(() {
                        _isButtonPressed = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      transform: Matrix4.identity()
                        ..scale(_isButtonPressed ? 0.8 : 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SizedBox(
                          width: screenWidth * 0.6,
                          height: screenWidth * 0.14,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _animateButton3();
                              });
                              _animateButton();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.grey[200],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.020,
                                horizontal: screenWidth * 0.05,
                              ),
                            ),
                            child: SizedBox(
                              width: screenWidth * 0.4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Commencer',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'Lato',
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          22), // add some space between the text and icon
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue,
                                    size: screenWidth * 0.07,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
