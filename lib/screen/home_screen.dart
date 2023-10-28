import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'assets/image/listGuide/faint/faint.jpg',
    'assets/image/listGuide/cuts/cuts.png',
    'assets/image/listGuide/choking/choking.png',
    'assets/image/listGuide/burns/burnt.jpg',
  ];

  List<String> titles = [
    'Faint',
    'Fingger Cuts',
    'Choking',
    'Minor Burns',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: _showEmergencyContactSheet,
                        icon: const Icon(Icons.person),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'ResQGuide',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Your go-to app for emergency medical assistance. In critical situations such as heart attacks, fainting, and more.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/guide$index');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Color(0xFFE55812)),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: SizedBox(
                                  height: 150,
                                  width: double.infinity,
                                  child: Image.asset(
                                    images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                titles[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Didn't find a suitable guide? \nAsk AI ",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: 'here!',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0E4749),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/ai');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEmergencyContactSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          decoration: const BoxDecoration(
            color: Color(0xFFEFE7DA),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/1771.jpg'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Glenn Garcia',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
                child: const Text('Emergency Contact'),
              ),
            ],
          ),
        );
      },
    );
  }
}
