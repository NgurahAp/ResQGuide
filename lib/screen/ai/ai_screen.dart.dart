import 'package:flutter/material.dart';
import 'package:resq_guide/service/guide.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({Key? key}) : super(key: key);

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  dynamic result;

  @override
  void initState() {
    super.initState();
  }

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
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25, // Increase the size of the icon
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Rapid Health\nInsights',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 40, // Mengurangi ukuran font
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ask AI for Instant Medical Guidance',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14, // Mengurangi ukuran font
                      ),
                    ),
                    const SizedBox(height: 35),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFEFE7DA),
                        hintText: 'Ask here...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Mengurangi bentuk rounded
                          borderSide: const BorderSide(
                            color: Color(0xFFD78B65), // Mengubah warna tepi
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Mengurangi bentuk rounded
                          borderSide: const BorderSide(
                            color: Color(0xFFD78B65), // Mengubah warna tepi
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Mengurangi bentuk rounded
                          borderSide: const BorderSide(
                            color: Color(0xFFE55812),
                          ),
                        ),
                      ),
                      cursorColor: const Color(0xFF0E4749),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _getRecommendation,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10), // Mengurangi ukuran padding
                          backgroundColor: Colors.grey[300],
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ), // Mengurangi ukuran font
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (isLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.brown),
                        ),
                      )
                    else if (result != null)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          result.choices[0].text,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _getRecommendation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await GuideService.getGuide(
        question: _controller.value.text,
      );
      if (result.choices[0].text == '/guide0' ||
          result.choices[0].text == '/guide1' ||
          result.choices[0].text == '/guide2' ||
          result.choices[0].text == '/guide3') {
      } else {
        setState(
          () {
            isLoading = false;
            this.result = result;
          },
        );
      }
      if (mounted) {}
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
