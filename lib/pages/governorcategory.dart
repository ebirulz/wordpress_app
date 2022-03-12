import 'package:flutter/material.dart';
import 'constant.dart';
import 'content.dart';

class GovernorCategory extends StatelessWidget {
  const GovernorCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkPurple,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: kDarkBlue.withOpacity(0.3),
          elevation: 0.0,
          leading: const BackButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Stack(
                children: const [
                  Image(
                    image: AssetImage('assets/notification.png'),
                    width: 31,
                    height: 31,
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11
                        ),
                      ),
                      radius: 10,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreateContainer('assets/Governor Category-image2.png',
                          'Biography', 'Gov. Douye Diri', true, context),
                      CreateContainer('assets/Governor Category-image3.png',
                          'Mandate', 'The Prosperity Agenda', false, context),
                      CreateContainer(
                          'assets/Governor Category-image7.png',
                          'Principal Staff',
                          'Office of the Governor',
                          false,
                          context),
                      CreateContainer(
                          'assets/Governor Category-image4.png',
                          'Speeches',
                          'Collection of Notable Speeches',
                          false,
                          context),
                      CreateContainer(
                          'assets/Governor Category-image5.png',
                          'Initiatives',
                          'Empowerment Programs',
                          false,
                          context),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Our Proud Partners: Zenith Bank | UBA | Agip | NCDMB',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Governor Category-image.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                colors: [
                              Colors.black.withOpacity(0.7),
                              kDarkPurple.withOpacity(0.8),
                            ])),
                        child: Column(
                          children: <Widget>[],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 40,
              top: 200,
              child: Text(
                'Principled, Proven, \nProgressive',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CreateContainer(
      String image, String text1, String text2, bool top, context) {
    return Row(
      children: [
        Container(
          margin: top
              ? EdgeInsets.only(left: 10, top: 15, bottom: 10, right: 5)
              : EdgeInsets.only(left: 10, top: 0, bottom: 10, right: 5),
          width: 80,
          height: 80,
          color: kLightPurple,
          child: Center(
            child: Image(
              image: AssetImage(image),
              width: 50,
              height: 50,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (top == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Content();
                  },
                ),
              );
            }
          },
          child: Container(
            margin: top
                ? EdgeInsets.only(left: 5, top: 15, bottom: 10, right: 10)
                : EdgeInsets.only(left: 5, top: 0, bottom: 10, right: 10),
            padding: EdgeInsets.only(top: 20, left: 20),
            width: 245,
            height: 80,
            color: kLightPurple,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                text1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(text2),
            ]),
          ),
        ),
      ],
    );
  }
}
