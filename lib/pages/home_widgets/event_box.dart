import 'package:flutter/material.dart';

class EventBox extends StatelessWidget {
  final int r;
  final int g;
  final int b;

  const EventBox({
    Key? key,
    required this.r,
    required this.g,
    required this.b,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: 110.0,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(5.0)),
        child: new Container(
          // child: Padding(
          //  padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: [
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 4.0, 8.0),
                  child: new Container(
                    // child: new Icon(
                    //   Icons.access_time,
                    //   size: 50.0,
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Start time ends :- time",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                flex: 2,
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
                  child: new Container(
                    // child: new Icon(
                    //   Icons.pie_chart,
                    //   size: 100.0,
                    // ),
                    //padding: const EdgeInsets.fromLTRB(
                    //  4.0, 10.0, 4.0, 10.0),
                    // child: Text(
                    //   "Start time ends :- time",
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 4,
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    child: Column(
                      children: [
                        Text("Event Name :-"),
                        Text("Society/Department Name :-"),
                        Text("Location :-"),
                        Text("Click Here For Details"),
                      ],
                    ),
                    decoration: BoxDecoration(
                        //color: Colors.blue,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                flex: 5,
              ),
              new Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0, 8.0),
                  child: new Container(
                    child: Column(
                      children: [
                        Text(""),
                        //  Text(""),
                        Text(
                          "Today",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(""),
                        Text(""),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(r, g, b, 1),
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
