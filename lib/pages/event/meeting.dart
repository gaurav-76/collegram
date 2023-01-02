import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({Key key}) : super(key: key);

  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  final todaysDate = DateTime.now();
  final focusedDay = DateTime.now();
  var _focusedCalendarDate = DateTime.now();
  final _initialCalendarDate = DateTime(2000);
  final _lastCalendarDate = DateTime(2050);

  TextEditingController _eventController = TextEditingController();

  final titleController = TextEditingController();
  final descpController = TextEditingController();
  final timeinput = TextEditingController();
  final url = TextEditingController();
  DateTime selectedCalendarDate;
  Map<DateTime, List<MyEvents>> mySelectedEvents;

  //  var url = Uri.parse("https://www.geeksforgeeks.org/");

  @override
  void initState() {
    selectedCalendarDate = _focusedCalendarDate;
    mySelectedEvents = {};
    super.initState();

    timeinput.text = ""; //set the initial value of text field
    //super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    timeinput.dispose();
    url.dispose();
    // _eventController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: AlertDialog(
                title: const Text('Add Event'),
                content: Column(
                  //controller: _eventController,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    buildTextField(
                        controller: titleController, hint: 'Enter Title'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    buildTextField(
                        controller: descpController, hint: 'Enter Description'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                      child: TextField(
                        controller:
                            timeinput, //editing controller of this TextField
                        decoration: InputDecoration(
                            icon: Icon(Icons.timer), //icon of text field
                            labelText: "Enter Time" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          TimeOfDay pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );
                          if (pickedTime != null) {
                            print(pickedTime.format(context)); //output 10:51 PM
                            DateTime parsedTime = DateFormat.jm()
                                .parse(pickedTime.format(context).toString());
                            //converting to DateTime so that we can further format on different pattern.
                            // print(parsedTime); //output 1970-01-01 22:53:00.000
                            String formattedTime =
                                DateFormat('HH:mm').format(parsedTime);
                            //print(formattedTime); //output 14:59:00
                            //DateFormat() is from intl package, you can format the time on any pattern you need.

                            setState(() {
                              timeinput.text =
                                  formattedTime; //set the value of text field.
                            });
                          }
                        },
                      ),
                    ),
                    buildTextField(controller: url, hint: 'Enter Meeting Link')
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (titleController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter title'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        //Navigator.pop(context);
                        return;
                      } else if (descpController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter description'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        //Navigator.pop(context);
                        return;
                      } else if (timeinput.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter start time'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        //Navigator.pop(context);
                        return;
                      } else if (url.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter meeting link'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        //Navigator.pop(context);
                        return;
                      } else {
                        setState(() {
                          if (mySelectedEvents[selectedCalendarDate] != null) {
                            mySelectedEvents[selectedCalendarDate]
                                ?.add(MyEvents(
                              eventTitle: titleController.text,
                              eventDescp: descpController.text,
                              eventTime: timeinput.text,
                              eventLink: url.text,
                            ));
                          } else {
                            mySelectedEvents[selectedCalendarDate] = [
                              MyEvents(
                                eventTitle: titleController.text,
                                eventDescp: descpController.text,
                                eventTime: timeinput.text,
                                eventLink: url.text,
                              )
                            ];
                          }
                        });

                        //titleController.clear();
                        //descpController.clear();

                        Navigator.pop(context);
                        titleController.clear();
                        descpController.clear();
                        timeinput.clear();
                        url.clear();
                        setState(() {});
                        return;
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ));
  }

  Widget buildTextField({String hint, TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Custom Calendar'),
          ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddEventDialog(),
        label: const Text(' + Add Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(color: Colors.black, width: 2.0),
              ),
              child: TableCalendar(
                focusedDay: _focusedCalendarDate,
                // today's date
                firstDay: _initialCalendarDate,
                // earliest possible date
                lastDay: _lastCalendarDate,
                // latest allowed date
                calendarFormat: CalendarFormat.month,
                // default view when displayed
                // default is Saturday & Sunday but can be set to any day.
                // instead of day number can be mentioned as well.
                weekendDays: const [DateTime.sunday, 6],
                // default is Sunday but can be changed according to locale
                startingDayOfWeek: StartingDayOfWeek.monday,
                // height between the day row and 1st date row, default is 16.0
                daysOfWeekHeight: 40.0,
                // height between the date rows, default is 52.0
                rowHeight: 46.0,
                // this property needs to be added if we want to show events
                eventLoader: _listOfDayEvents,
                // Calendar Header Styling
                headerStyle: const HeaderStyle(
                  titleTextStyle:
                      TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  formatButtonTextStyle:
                      TextStyle(color: Colors.red, fontSize: 16.0),
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.yellow,
                    size: 28,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.yellow,
                    size: 28,
                  ),
                ),
                // Calendar Days Styling
                daysOfWeekStyle: const DaysOfWeekStyle(
                  // Weekend days color (Sat,Sun)
                  weekendStyle: TextStyle(color: Colors.red),
                ),
                // Calendar Dates styling
                calendarStyle: const CalendarStyle(
                  // Weekend dates color (Sat & Sun Column)
                  weekendTextStyle: TextStyle(color: Colors.red),
                  // highlighted color for today
                  todayDecoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  // highlighted color for selected day
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFF54b435),
                    shape: BoxShape.circle,
                  ),
                  markerDecoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
                selectedDayPredicate: (currentSelectedDate) {
                  // as per the documentation 'selectedDayPredicate' needs to determine
                  // current selected day
                  return (isSameDay(selectedCalendarDate, currentSelectedDate));
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // as per the documentation
                  if (!isSameDay(selectedCalendarDate, selectedDay)) {
                    setState(() {
                      selectedCalendarDate = selectedDay;
                      _focusedCalendarDate = focusedDay;
                    });
                  }
                },
              ),
            ),
            ..._listOfDayEvents(selectedCalendarDate).map(
              (myEvents) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                        ),
                        backgroundColor: Color(0xFFd9d9d9), // <-- SEE HERE
                        builder: (context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    tileColor: Color(0xFF54b435),
                                    // color: Colors.yellowAccent
                                    shape: RoundedRectangleBorder(
                                      //<-- SEE HERE
                                      side: BorderSide(width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Text('Title',
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    subtitle: Text('${myEvents.eventTitle}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: ListTile(
                                      tileColor: Color(0xFF54b435),
                                      // color: Colors.yellowAccent
                                      shape: RoundedRectangleBorder(
                                        //<-- SEE HERE
                                        side: BorderSide(width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: Text('Description'),
                                      subtitle: Text('${myEvents.eventDescp}'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: ListTile(
                                      // color: Colors.yellowAccent
                                      tileColor: Color(0xFF54b435),
                                      shape: RoundedRectangleBorder(
                                        //<-- SEE HERE
                                        side: BorderSide(width: 2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      title: Text('Time'),
                                      subtitle: Text('${myEvents.eventTime}'),
                                    ),
                                  ),
                                  ListTile(
                                    tileColor: Color(0xFF54b435),
                                    // color: Colors.yellowAccent
                                    shape: RoundedRectangleBorder(
                                      //<-- SEE HERE
                                      side: BorderSide(width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    title: Text('Meeting Link'),
                                    subtitle: Text('${myEvents.eventLink}'),
                                    trailing: Icon(Icons.navigate_next),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AlertDialog(
                                                  actions: [
                                                    Column(
                                                      children: [
                                                        Center(
                                                          child: ElevatedButton(
                                                            child: Text(
                                                              "Open in Browser",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              // String val =
                                                              //     'www.google.com';//${myEvents.eventLink}';
                                                              const url =
                                                                  "https://meet.google.com/?pli=1";
                                                              // ignore: deprecated_member_use
                                                              if (await canLaunch(
                                                                  url)) {
                                                                // ignore: deprecated_member_use
                                                                await launch(
                                                                    url); //forceWebView is true now
                                                              } else {
                                                                throw 'Could not launch $url';
                                                              }
                                                            },
                                                            // _launchURLBrowser(
                                                            //     "${myEvents.eventDescp}")),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: ElevatedButton(
                                                              child: Text(
                                                                "Open in App",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                const url =
                                                                    "https://meet.google.com/?pli=1";
                                                                // ignore: deprecated_member_use
                                                                if (await canLaunch(
                                                                    url)) {
                                                                  // ignore: deprecated_member_use
                                                                  await launch(
                                                                      url); //forceWebView is true now
                                                                } else {
                                                                  throw 'Could not launch $url';
                                                                }
                                                              }),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    color: Colors.black,
                    child: ListTile(
                      // borderRadius:
                      textColor: Colors.white,
                      leading: const Icon(
                        Icons.event,
                        color: Colors.red,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 9.0),
                        child: Text('Event Title:   ${myEvents.eventTitle}'),
                      ),
                      subtitle: Text('Start Time:   ${myEvents.eventTime}'),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyEvents {
  final String eventTitle;
  final String eventDescp;
  final String eventTime;
  final String eventLink;

  MyEvents({this.eventTitle, this.eventDescp, this.eventTime, this.eventLink});

  @override
  String toString() => eventTitle;
}
