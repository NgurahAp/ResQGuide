import 'package:flutter/material.dart';

class BurnsPage extends StatelessWidget {
  const BurnsPage({super.key});

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
                    'Minor \nBurns',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Cool the burn.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Immediately immerse the burn in cool tap water or apply cold, wet compresses for about 10 minutes or until the pain subsides. Avoid using ice directly on the burn, as extreme cold can further damage the tissue',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset('assets/image/listGuide/burns/step1.png'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Cover the burn with a sterile bandage.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    ' If blisters form, let them heal on their own while keeping the area covered with a nonstick, sterile bandage',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset('assets/image/listGuide/burns/step2.png'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '- Use a cold compress.',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Gently place the cold compress on top of the bandage covering the burn. Hold it in place for about 10-15 minutes. Avoid applying excessive pressure or leaving the compress on for too long, as this can cause discomfort or damage to the skin.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset('assets/image/listGuide/burns/step3.png'),
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
                    'While minor burns can often be treated at home, it is important to seek medical attention in certain situations. Consult a doctor if the burn covers a large area, is deep, or affects sensitive areas.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset('assets/image/listGuide/burns/step4.png'),
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
