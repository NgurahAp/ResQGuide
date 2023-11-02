import 'package:flutter/material.dart';

class FaintPage extends StatelessWidget {
  const FaintPage({super.key});

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
                    'Fainted \nPerson',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Ensure Safety.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Make sure the person is in safe position and call emergency medical immediately',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset('assets/image/listGuide/faint/step1.png'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Check Responsiveness.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'If the person is responsive, help them lie down on their back with their legs elevated slightly. This can help improve blood flow to the brain and prevent further fainting episodes.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset('assets/image/listGuide/faint/step2a.png'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Maintain an Open Airway.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ensure that the person's airway is clear and unobstructed. If necessary, gently tilt their head back to open the airway.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Monitor vital signs',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Keep an eye on the person's breathing, pulse, and consciousness level. If their condition worsens, or if they stop breathing or their heart stops, be prepared to perform CPR if you are trained to do so.",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/image/listGuide/faint/step3.png',
                        width: 150, // Set the desired width
                        height: 100, // Set the desired height
                      ),
                      Image.asset(
                        'assets/image/listGuide/faint/step3b.png',
                        width: 150, // Set the desired width
                        height: 100, // Set the desired height
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Seek medical attention.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ensure that the person's airway is clear and unobstructed. If necessary, gently tilt their head back to open the airway.",
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
