import 'package:auto_size_text/auto_size_text.dart';
import 'package:corona_tracking/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

bool unwell;

class Symptoms extends StatelessWidget {
  // *********** Symptoms Container ****************** //
  Widget _symptoms(String imageLocation, imageCaption) {
    return Container(
      width: 150,
      child: Card(
        color: teal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Image.asset(
              imageLocation,
              height: 150,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Text(
                  imageCaption,
                  style: GoogleFonts.merriweather(
                      fontSize: 15, color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

  myDialouge(BuildContext context, String title, String content) {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5,
            title: Text(
              title,
              style: GoogleFonts.merriweather(
                fontSize: 20,
              ),
            ),
            // content: Text(
            //   content,
            //   style: GoogleFonts.merriweather(
            //     fontSize: 16,
            //   ),
            // ),
            content: unwell == true
                ? Text(content,
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                    ))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: Image.asset('images/stayhome.jpg')),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Corona Tracking'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **** Welcome Dear User ****** //
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Welcome Dear User ',
                      style: GoogleFonts.merriweather(
                          fontSize: 26, fontWeight: FontWeight.w500),
                    ),
                    Image.asset(
                      'images/namaste.jpg',
                      height: 40,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Column(
                children: [
                  Text(
                    'How are you feeling today ?',
                    style: GoogleFonts.merriweather(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 90),
                      Column(
                        // ************* WELL ********* //
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.smile,
                                  color: Colors.blue, size: 50),
                              onPressed: () {
                                unwell = false;
                                myDialouge(context, "That's Great",
                                    "Stay home and stay safe");
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Well',
                            style: GoogleFonts.merriweather(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        // ************* UNWELL ********* //
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.sadTear,
                                  color: Colors.red, size: 50),
                              onPressed: () {
                                unwell = true;
                                myDialouge(
                                  context,
                                  "Stay Alert!!!",
                                  "Stay in self-isolation and consult the doctor",
                                );
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Unwell',
                            style: GoogleFonts.merriweather(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // ************** Horizontal List of Transmission ***************** //
              Text(
                'Transmission',
                style: GoogleFonts.merriweather(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _symptoms('images/Contagious1.png', "Contaminated"),
                    _symptoms('images/Contagious2.png', "Air by Cough"),
                    _symptoms('images/Contagious3.png', "By Handshake"),
                    _symptoms('images/cough.png', "By droplets"),
                  ],
                ),
              ),
              // ************** Horizontal List of Symptoms ***************** //
              Text(
                'Symptoms',
                style: GoogleFonts.merriweather(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _symptoms('images/cough.png', "Cough"),
                    _symptoms('images/fever.png', "Fever"),
                    _symptoms('images/headache.png', "Headache"),
                    _symptoms('images/sore_throat.png', "Sore Throat"),
                    _symptoms('images/cold.png', "Cold"),
                  ],
                ),
              ),

              //*************** List of Preventions ************* //

              SizedBox(
                height: 20,
              ),

              Text(
                'Preventions',
                style: GoogleFonts.merriweather(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _symptoms('images/Prevention1.png', "Wash hands often"),
                    _symptoms('images/Prevention2.png', "Use Masks"),
                    _symptoms('images/Prevention3.png', "Avoid Handshake"),
                    _symptoms('images/Prevention4.png', "Cover your cough"),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.only(right: 5.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: teal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            'Seek medical care in case of any emergenies',
                            maxLines: 4,
                            style: GoogleFonts.merriweather(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            "images/medical_care.jpg",
                            height: 200,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
