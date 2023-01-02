import 'package:flutter/material.dart';

//void main() => runApp(const MyApp());

class MyMalhar extends StatelessWidget {
  const MyMalhar({key});

  @override
  Widget build(BuildContext context) {
    const title = 'Horizontal List';

    return Container(
        margin: EdgeInsets.only(
          left: 20,
        ),
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          //  BorderRadius.all(20),
          // itemBuilder: (BuildContext context, int index) {  },
          children: <Widget>[
            Container(
              width: 140,
              height: 90,
              //color: Colors.purple[600],
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              // child: const Center(
              //     child: Text(
              //   'Post 1',
              //   style: TextStyle(fontSize: 18, color: Colors.white),
              // )),
              child: FittedBox(
                child: Image.asset('assets/images/hallowen.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 140,
              height: 90,
              //color: Colors.purple[500],
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              // child: const Center(
              //     child: Text(
              //   'Post 2',
              //   style: TextStyle(fontSize: 18, color: Colors.white),
              // )),
              child: FittedBox(
                child: Image.asset('assets/images/inkarnation.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 140,
              height: 90,
              //color: Colors.purple[400],
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              // child: const Center(
              //     child: Text(
              //   'Post 3',
              //   style: TextStyle(fontSize: 18, color: Colors.white),
              // )),
              child: FittedBox(
                child: Image.asset('assets/images/diwali.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 140,
              height: 90,
              //color: Colors.purple[300],
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(217, 217, 217, 1),
              ),
              // child: const Center(
              //     child: Text(
              //   'Post 4',
              //   style: TextStyle(fontSize: 18, color: Colors.white),
              // )),
              child: FittedBox(
                child: Image.asset('assets/images/octave.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 12,
            ),
          ],
        ));
  }
}
