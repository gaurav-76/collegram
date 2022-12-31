import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/home_widgets/bottom_bar.dart';
import 'package:project/pages/login/forgot_pass.dart';
import 'package:project/pages/login/signup_page.dart';

class Login1 extends StatefulWidget {
  Login1({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login1> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            //backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 17.0, color: Colors.white),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            //backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 17.0, color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ForgotPassword()),
                            )),
                      },
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text('Signup'),
                    ),
                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (context, a, b) => BottomBar(),
                    //           transitionDuration: Duration(seconds: 0),
                    //         ),
                    //         (route) => false)
                    //   },
                    //   child: Text(''),
                    //   //child: 'T',
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:project/pages/login/Login 2/constants.dart';
// import 'package:project/pages/login/signup_page.dart';

// class Login extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<Login> {
//   bool _rememberMe = false;
//   final _formKey = GlobalKey<FormState>();

//   var email = "";
//   var password = "";
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   userLogin() async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => BottomBar(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print("No User Found for that Email");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             //backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "No User Found for that Email",
//               style: TextStyle(fontSize: 17.0, color: Colors.white),
//             ),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         print("Wrong Password Provided by User");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             //backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Wrong Password Provided by User",
//               style: TextStyle(fontSize: 17.0, color: Colors.white),
//             ),
//           ),
//         );
//       }
//     }
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   Widget _buildEmailTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Email',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//               color: Colors.black,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.black,
//               ),
//               hintText: 'Enter your Email',
//               hintStyle: kHintTextStyle,
//             ),
//             controller: emailController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please Enter Email';
//               } else if (!value.contains('@')) {
//                 return 'Please Enter Valid Email';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPasswordTF() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           'Password',
//           style: kLabelStyle,
//         ),
//         SizedBox(height: 10.0),
//         Container(
//           alignment: Alignment.centerLeft,
//           decoration: kBoxDecorationStyle,
//           height: 60.0,
//           child: TextFormField(
//             obscureText: true,
//             style: TextStyle(
//               color: Colors.black,
//               fontFamily: 'OpenSans',
//             ),
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(top: 14.0),
//               prefixIcon: Icon(
//                 Icons.lock,
//                 color: Colors.black,
//               ),
//               hintText: 'Enter your Password',
//               hintStyle: kHintTextStyle,
//             ),
//             controller: passwordController,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please Enter Password';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildForgotPasswordBtn() {
//     return Container(
//       alignment: Alignment.centerRight,
//       child: Padding(
//         padding: const EdgeInsets.only(right: 0.0),
//         child: TextButton(
//           onPressed: () => {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: ((context) => ForgotPassword()),
//                 )),
//           },
//           //padding: EdgeInsets.only(right: 0.0),
//           child: Text(
//             'Forgot Password ?',
//             style: TextStyle(
//                 fontSize: 16.0,
//                 color: Color(0xFF0000ee),
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRememberMeCheckbox() {
//     return Container(
//       height: 20.0,
//       child: Row(
//         children: <Widget>[
//           Theme(
//             data: ThemeData(unselectedWidgetColor: Colors.black),
//             child: Checkbox(
//               value: _rememberMe,
//               checkColor: Colors.white,
//               activeColor: Colors.black,
//               onChanged: (value) {
//                 setState(() {
//                   _rememberMe = value!;
//                 });
//               },
//             ),
//           ),
//           Text(
//             'Remember me',
//             style: kLabelStyle,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoginBtn() {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 25.0),
//       width: double.infinity,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//           height: 50.0,
//           child: ElevatedButton(
//             //elevation: 5.0,
//             style: ElevatedButton.styleFrom(
//               primary: Color.fromRGBO(41, 49, 48, 1),
//             ),
//             onPressed: () {
//               // Validate returns true if the form is valid, otherwise false.
//               if (_formKey.currentState!.validate()) {
//                 setState(() {
//                   email = emailController.text;
//                   password = passwordController.text;
//                 });
//                 userLogin();
//               }
//             }, // child: null,
//             //padding: EdgeInsets.all(15.0),
//             //shape: RoundedRectangleBorder(
//             // borderRadius: BorderRadius.circular(30.0),
//             child: Text(
//               'LOGIN',
//               style: TextStyle(
//                 color: Color(0xFFffffff),
//                 letterSpacing: 1.5,
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'OpenSans',
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSignInWithText() {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "Don't have an Account ? ",
//             style: kLabelStyle,
//           ),
//           TextButton(
//             onPressed: () => {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, a, b) => Signup(),
//                     transitionDuration: Duration(seconds: 0),
//                   ),
//                   (route) => false)
//             },
//             child: Text(
//               'Signup',
//               style: TextStyle(
//                 color: Colors.red,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'OpenSans',
//                 fontSize: 16.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnnotatedRegion<SystemUiOverlayStyle>(
//         key: _formKey,
//         value: SystemUiOverlayStyle.light,
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 height: double.infinity,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xFFd9d9d9),
//                       Color(0xFFd9d9d9),
//                       Color(0xFFd9d9d9),
//                       Color(0xFFd9d9d9),
//                     ],
//                     // stops: [0.1, 0.4, 0.7, 0.9],
//                   ),
//                 ),
//               ),
//               Container(
//                 height: double.infinity,
//                 child: SingleChildScrollView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 40.0,
//                     vertical: 120.0,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontFamily: 'OpenSans',
//                             fontSize: 35.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 8.0, right: 8.0, bottom: 8.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             'Please sign in to continue',
//                             style: TextStyle(
//                               color: Color(0xFF686868),
//                               fontFamily: 'OpenSans',
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Form(
//                           child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 20, horizontal: 30),
//                               child: ListView(children: [
//                                 SizedBox(height: 50.0),
//                                 _buildEmailTF(),
//                                 SizedBox(
//                                   height: 30.0,
//                                 ),
//                                 _buildPasswordTF(),
//                               ]))),
//                       _buildForgotPasswordBtn(),
//                       _buildRememberMeCheckbox(),
//                       _buildLoginBtn(),
//                       _buildSignInWithText(),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
