import 'package:flutter/material.dart';
import 'package:project/pages/home_widgets/circle_avatar.dart';
import 'package:project/pages/home_widgets/list_view.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      //  shrinkWrap: true,
       
       //backgroundColor: Colors.white
        
        children: <Widget>[
        Container(
          //          decoration: const BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     blurRadius: 25.0,
          //     ),
          // ],
          //          )
          //   padding: Vx.m32,
          //height: 80.0,
          width: MediaQuery.of(context).size.width,
          //color: MyTheme.creamColor,
          //color: Colors.white,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.circular(5.0),
            color: Color.fromRGBO(255, 255, 255, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 2.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Hey, Let See What's Going in "
                  .text
                  .xl2
                  .bold
                  // .color(context.theme.accentColor)
                  .color(Colors.black)
                  .make(),
              "Your College"
                  .text
                  .xl2
                  .bold
                  .color(Color.fromRGBO(255, 153, 0, 1))
                  .make(),
            ],
          ).px32().pOnly(bottom: 10.0),
        ).pOnly(bottom: 20.0),
        Avatar(
          name: "Malhar , Annual Fest Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0),
        const MyMalhar(),
        Avatar(
          name: "Octave , Music Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Dristi , Roctract Club Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Cultural Committee".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "CSI , Tech Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Training and Placement Cell".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Chromavita , Art Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Panache , Fashion Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Mavericks , Dance Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "VIBE , Diwali Fest Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Bhagwan Parshuram Institute Of Technology".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "School Of Business Administration".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "IEEE , Tech Community Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Newton School Coding Club".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Kalam , Literary Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Avaran , Dramatic Society Of BPIT".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Anvesham".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "Examination Cell".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar(),
        Avatar(
          name: "IOSD".toString(),
          collegeName: "Bhagwan Parshuram Institute Of Technology".toString(),
        ).pOnly(bottom: 12.0, top: 30.0),
        MyMalhar().pOnly(bottom: 50.0),
      ],
    );
  }
}
