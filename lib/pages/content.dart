import 'package:flutter/material.dart';
import 'constant.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkPurple,
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: 400,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/Content-image.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: CircleAvatar(
                                            radius: 30,
                                            backgroundColor:
                                                kDarkPurple.withOpacity(0.5),
                                            child: const Icon(
                                              Icons.arrow_back_outlined,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                              kDarkPurple.withOpacity(0.5),
                                          child: Stack(
                                            children: const [
                                              Image(
                                                image: AssetImage(
                                                    'assets/notification.png'),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  radius: 10,
                                                  backgroundColor: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 135,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      width: 340,
                                      height: 170,
                                      decoration: BoxDecoration(
                                          color: kDarkPurple.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'Gov. Diri Tasks Army On Agge,\nOluasiri Bases Seeks Cooperation\nOn Arrests in Bayelsa\nCommunitties',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Image(
                                        image: const AssetImage(
                                            'assets/Content-image2.png'),
                                        width: 45,
                                        height: 45,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text('Date Posted'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '08 May 2021, 08:21 AM',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Officials with President Joe Biden's coronavirus task force say 110 million Americans will be fully vaccinated by the end of Friday, with a total of 150 million vaccinated through the first shot. 'We are far ahead of where anyone thought we would be in our war against the virus,' said Jeffrey Zients, the White House coronavirus task force director.",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const Text(
                                    "That information, coming from an official-sounding group, makes it seem like there’s little benefit — and potentially some harm — to getting vaccinated against COVID-19.",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Our Proud Partners: Zenith Bank | UBA | Agip | NCDMB',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
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
