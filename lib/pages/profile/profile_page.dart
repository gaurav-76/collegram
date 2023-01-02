import 'package:flutter/material.dart';
import 'package:project/pages/profile/profile_widget.dart';
import 'package:project/pages/profile/user.dart';
import 'package:project/pages/profile/user_detail.dart';
import 'package:velocity_x/velocity_x.dart';

import '../home_widgets/notice_list.dart';
import '../notice/Upload files Modal/button_widget.dart';
import '../setting_page.dart';

class ProfilePage2 extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage2> {
  String about = "Update About";
  TextEditingController _about;

  String degree = "Update Degree";
  TextEditingController _degree;

  String duration = "Update Duration";
  TextEditingController _duration;

  String cgpa = "Update CGPA";
  TextEditingController _cgpa;

  String company_name = "Update Company Name";
  TextEditingController _company_name;

  String role = "Update Your Role";
  TextEditingController _role;

  String cduration = "Update Company Duration";
  TextEditingController _cduration;

  String experience_infro = "Update Experience Detail";
  TextEditingController _experience_info;

  String course = "Update Course Name";
  TextEditingController _course;

  String course_duration = "Update Course Duration";
  TextEditingController _course_duration;

  String certificate_link = "Update CGPA";
  TextEditingController _certificate_link;

  String skill = "Update Skill Detail";
  TextEditingController _skill;

  // @override
  // ininstate() {
  //   _about = new TextEditingController();
  //   super.initState();
  // }

  @override
  initState() {
    _about = new TextEditingController();
    _degree = new TextEditingController();
    _duration = new TextEditingController();
    _cgpa = new TextEditingController();
    _company_name = new TextEditingController();
    _role = new TextEditingController();
    _cduration = new TextEditingController();
    _experience_info = new TextEditingController();
    _course = new TextEditingController();
    _course_duration = new TextEditingController();
    _certificate_link = new TextEditingController();
    _skill = new TextEditingController();
    super.initState();
  }

//  final degree = TextEditingController();
  //final duration = TextEditingController();
  //final cgpa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            //onPressed: () => Navigator.of(context).pop(),
            ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting()),
              );
            },
            icon: Icon(
              Icons.settings,
              size: 32.0,
            ).p2(),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 14),
          buildName(user),
          const SizedBox(height: 24),
          buildAbout(user),
          const SizedBox(height: 24),
          buildEducation(user),
          const SizedBox(height: 24),
          buildEExperience(user),
          const SizedBox(height: 24),
          buildCertifications(user),
          const SizedBox(height: 24),
          buildSkills(user),
          const SizedBox(height: 64),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 2),
          Text(
            user.profession,
            style: TextStyle(color: Colors.grey, fontSize: 17.0),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text('About',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                trailing: Column(children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      color: Colors.black,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text("About Detail"),
                            content: Column(
                              children: [
                                buildTextField(
                                    controller: _about, hint: 'Enter About'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_about.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter about yourself'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: ElevatedButton(
                                  child: const Text("Update"),
                                  onPressed: () {
                                    setState(() {
                                      this.about = _about.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            // Text('Education',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                about,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );

  Widget buildEducation(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text('Education',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                trailing: Column(children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      color: Colors.black,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text("Education Detail"),
                            content: Column(
                              children: [
                                buildTextField(
                                    controller: _degree, hint: 'Enter Degree'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _duration,
                                    hint: 'Enter Duration'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _cgpa, hint: 'Enter CGPA'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_degree.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter degree e.g: Btech / BA'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_duration.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter duration e.g: 2019-2023'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_cgpa.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please enter cgpa'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: ElevatedButton(
                                  child: const Text("Update"),
                                  onPressed: () {
                                    setState(() {
                                      this.degree = _degree.text;
                                      this.duration = _duration.text;
                                      this.cgpa = _cgpa.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            // Text('Education',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                degree,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                duration,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'CGPA : $cgpa',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );

  Widget buildEExperience(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text('Experience',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                trailing: Column(children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      color: Colors.black,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text("Internship Detail"),
                            content: Column(
                              children: [
                                buildTextField(
                                    controller: _company_name,
                                    hint: 'Enter Company Name'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _role, hint: 'Enter Your Role'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _cduration,
                                    hint: 'Enter Duration'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _experience_info,
                                    hint: 'Enter your experience'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_company_name.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter company name'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_cduration.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Please enter duration'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_role.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter role e.g. Web Developer'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_experience_info.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter experience in brief'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: ElevatedButton(
                                  child: const Text("Update"),
                                  onPressed: () {
                                    setState(() {
                                      this.company_name = _company_name.text;
                                      this.cduration = _cduration.text;
                                      this.role = _role.text;
                                      this.experience_infro =
                                          _experience_info.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            // Text('Education',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                company_name,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                cduration,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                role,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                experience_infro,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );

  Widget buildCertifications(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text('Certifications',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                trailing: Column(children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      color: Colors.black,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text("Course Detail"),
                            content: Column(
                              children: [
                                buildTextField(
                                    controller: _course,
                                    hint: 'Enter course name'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _course_duration,
                                    hint: 'Enter course Duration'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                buildTextField(
                                    controller: _cgpa,
                                    hint: 'Enter certificate link'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_course.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter course name'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_course_duration.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter course duration'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  } else if (_certificate_link.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter certificate link'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: ElevatedButton(
                                  child: const Text("Update"),
                                  onPressed: () {
                                    setState(() {
                                      this.course = _course.text;
                                      this.course_duration =
                                          _course_duration.text;
                                      this.certificate_link =
                                          _certificate_link.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            // Text('Education',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                course,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                course_duration,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Link : $certificate_link',
                style: TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );

  Widget buildSkills(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text('Skills',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                trailing: Column(children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                      ),
                      color: Colors.black,
                      onPressed: () => showDialog(
                        context: context,
                        builder: (ctx) => SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text("Skills Detail"),
                            content: Column(
                              children: [
                                buildTextField(
                                    controller: _skill, hint: 'Enter skills'),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (_about.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Please enter your skills'),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                    //Navigator.pop(context);
                                    return;
                                  }
                                },
                                child: ElevatedButton(
                                  child: const Text("Update"),
                                  onPressed: () {
                                    setState(() {
                                      this.skill = _skill.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
            // Text('Education',
            //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                skill,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );

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
}
