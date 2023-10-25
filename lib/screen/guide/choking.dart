import 'package:flutter/material.dart';

class ChokingPage extends StatelessWidget {
  const ChokingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/aiPage.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Choking',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Assess the situation.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Determine if the person is conscious and able to cough or speak. If they are unable to cough, speak, or breathe, immediate action is needed.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/image/listGuide/choking/step1.png',
                      height: 175,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Call for help.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "If the person is unable to breathe or is in distress, call emergency services or ask someone nearby to call for help.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Perform the Heimlich maneuver.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Stand behind the person and place your arms around their waist. Make a fist with one hand and place it just above the navel, thumb side in. Grasp the fist with your other hand and give quick, upward thrusts to the abdomen. Continue these thrusts until the object blocking the airway is dislodged.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/listGuide/Choking/step2.png',
                        height: 125,
                      ),
                      Image.asset(
                        'assets/image/listGuide/Choking/step3.png',
                        height: 125,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Seek medical attention',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Even if the object is dislodged, it is important to seek medical attention to ensure there are no further complications.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
