import 'package:flutter/material.dart';

class CutsPage extends StatelessWidget {
  const CutsPage({super.key});

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
                    'Fingger\nCuts',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Rinse the cut.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Rinse the cut with cool water to remove any dirt or debris',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/image/listGuide/cuts/step1.png',
                      height: 175,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Stop the bleeding.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Apply gentle pressure with a clean cloth or gauze to stop the bleeding. If the bleeding doesn't stop after 10 minutes of continuous pressure, seek medical help. If the bleeding has stopped, clean the area around the cut with mild soap and water. Avoid using strong cleaning solutions like hydrogen peroxide or rubbing alcohol, as they may irritate the wound.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/image/listGuide/cuts/step2.png',
                      height: 175,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Cover the cut.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Cover the cut with a clean bandage or sterile gauze to protect it from further contamination. Change the bandage regularly, at least once a day, or whenever it becomes dirty or wet",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/image/listGuide/cuts/step3.png',
                      height: 175,
                    ),
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
                    "Watch for signs of infection, such as redness, swelling, warmth, pain, or pus. If you notice any of these signs or if your child develops a fever, contact a doctor",
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
