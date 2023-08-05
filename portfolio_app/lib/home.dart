// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final Shader headerGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 1, 242, 255),
    Color.fromARGB(255, 33, 170, 97),
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  final Shader highlightGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 43, 255, 1),
    Color.fromARGB(255, 255, 225, 0),
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  final Shader OverallTextGradient = LinearGradient(colors: <Color>[
    Color.fromARGB(255, 48, 1, 255),
    Color(0xfff39060),
    Color.fromARGB(255, 96, 201, 243),
    Color.fromARGB(255, 255, 89, 0),
  ]).createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  mySkills(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = OverallTextGradient),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(type),
        )
      ],
    );
  }

  mySpecialization(icon, text) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color.fromARGB(255, 30, 31, 32),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                    foreground: Paint()..shader = highlightGradient,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            itemBuilder: (context) => [
                  PopupMenuItem(
                      child: TextButton(
                    child: Text(
                      'Projects',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'projects');
                    },
                  )),
                  PopupMenuItem(
                      child: TextButton(
                    child: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'about');
                    },
                  )),
                ]),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 19, 16, 16),
              Color.fromARGB(255, 0, 0, 0),
            ],
          ),
        ),
        child: SlidingSheet(
          elevation: 8,
          cornerRadius: 16,
          snapSpec: const SnapSpec(
            // Enable snapping. This is true by default.
            snap: true,
            // Set custom snapping points.
            snappings: [0.4, 0.7, 1.0],
            // Define to what the snappings relate to. In this case,
            // the total available space that the sheet can expand to.
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          // The body widget will be displayed under the SlidingSheet
          // and a parallax effect can be applied to it.
          body: Center(
            child: Text('This widget is below the SlidingSheet'),
          ),
          builder: (context, state) {
            // This is the content of the sheet that will get
            // scrolled, if the content is bigger than the available
            // height of the sheet.
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      mySkills('6+', 'Projects'),
                      mySkills('4', 'Teaching'),
                      mySkills('10', 'Communication'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Specialized In',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontIcons.android, 'Android'),
                          mySpecialization(FontIcons.android, 'gitHub'),
                          mySpecialization(FontIcons.android, 'python'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpecialization(FontIcons.android, 'Android'),
                          mySpecialization(FontIcons.android, 'gitHub'),
                          mySpecialization(FontIcons.android, 'python'),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
