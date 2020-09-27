import 'package:auto_size_text/auto_size_text.dart';
import 'package:corona_tracking/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutCorona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Introduction',
                style: GoogleFonts.merriweather(
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                'Corona viruses are a group of related RNA viruses that cause diseases in mammals and birds. In humans, these viruses cause respiratory tract infections that can range from mild to lethal. Mild illnesses include some cases of the common cold, while more lethal varities can cause Severe acute respiratory syndrome(SARS), Middle east respiratory syndrome(MERS), and COVID-19. Symptoms in other species vary: in chickens, they cause an upper respiratory tract disease, while in cows and pigs they cause diarrhea.',
                // maxLines: 16,
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'History',
                style: GoogleFonts.merriweather(
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                "The disease appears to have originated from a Wuhan seafood market where wild animals, including marmots, birds, rabbits, bats and snakes, are traded illegally. Corona viruses are known to jump from animals to humans, so it’s thought that the first people infected with the disease – a group primarily made up of stallholders from the seafood market – contracted it from contact with animals.",
                // maxLines: 16,
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // ********* Symptoms *********** //
              SizedBox(
                height: 15,
              ),
              Text(
                'Symptoms',
                style: GoogleFonts.merriweather(
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                'Symptoms usually begin 2 to 14 days after you come into contact with the virus. Common symptoms of corona virus are :',
                // maxLines: 16,
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // ****** Symptoms with Bullets ******** //
              Column(
                children: [
                  _symptoms('Sore throat'),
                  _symptoms('Headache'),
                  _symptoms('Fever'),
                  _symptoms('Dry cough'),
                  _symptoms('Loss of appetite'),
                  _symptoms('Body aches'),
                  _symptoms('Shortness of breath'),
                  _symptoms('Fatigue'),
                  _symptoms('Congestion or runny nose'),
                  _symptoms('Nausea or vomiting'),
                  _symptoms('Diarrhea'),
                ],
              ),

              // ********* Preventions *********** //
              SizedBox(
                height: 15,
              ),
              Text(
                'Preventions',
                style: GoogleFonts.merriweather(
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AutoSizeText(
                'Some common preventions of Covid-19 are :',
                // maxLines: 16,
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // ****** Preventions with Bullets ******** //
              Column(
                children: [
                  _symptoms('Wear a (homemade) mask'),
                  _symptoms('Wash your hands frequently'),
                  _symptoms('Avoid touching your face'),
                  _symptoms('Stop shaking hands'),
                  _symptoms('Don’t share personal items'),
                  _symptoms('Clean and disinfect surfaces'),
                  _symptoms('Maintain physical distancing'),
                  _symptoms('Do not gather in groups'),
                  _symptoms('Avoid eating outside'),
                  _symptoms('Wash fresh groceries'),
                  _symptoms(' Self-quarantine if sick'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _symptoms(String text) {
    return Row(
      children: [
        CircleAvatar(backgroundColor: black, radius: 3),
        SizedBox(width: 10),
        AutoSizeText(
          text,
          maxLines: 2,
          style: GoogleFonts.merriweather(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
