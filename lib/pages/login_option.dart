import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';
import 'login/login_page.dart';

class LoginOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.685,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(41, 49, 48, 1),
                    ),
                    onPressed: (() => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login1(),
                              ),
                              (route) => false)
                        }),
                    child: Text(
                      'Login as a Student',
                      style: TextStyle(fontSize: 18.0),
                    )),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 22.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF293130),
                  ),
                  onPressed: (() => {}),
                  child: const Text(
                    'Login as a Department',
                    style: TextStyle(fontSize: 18.0),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
