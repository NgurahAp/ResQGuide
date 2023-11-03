import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:resq_guide/viewModel/widget/login_form.dart';
import 'package:resq_guide/viewModel/service/login_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DA),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/image/firstAid.png',
                  width: 200,
                  height: 200,
                ),
                const Text(
                  'ResQGuide',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 50),
                LoginFormWidget(
                  controller: _usernameCtrl,
                  hintText: 'Username',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 20),
                LoginFormWidget(
                  controller: _passwordCtrl,
                  hintText: 'Password',
                  prefixIcon: Icons.password_rounded,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'SignIn',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Warna teks "Sign In"
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Material(
                      elevation: 4, // Atur tinggi elevasi sesuai kebutuhan Anda
                      shape: const CircleBorder(),
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: Color(0xFF0E4749), // Warna latar belakang
                          shape: CircleBorder(),
                        ),
                        child: SizedBox(
                          width: 30, // Mengatur lebar lingkaran
                          height: 30, // Mengatur tinggi lingkaran
                          child: IconButton(
                            onPressed: () async {
                              String username = _usernameCtrl.text;
                              String password = _passwordCtrl.text;
                              bool isLogin =
                                  await LoginService.login(username, password);
                              if (isLogin) {
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamed(context, '/home');
                              } else {
                                // ignore: use_build_context_synchronously
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: const Text(
                                        "Username atau Password Tidak Valid"),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                        ),
                                        child: const Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            icon: const Icon(
                              Icons
                                  .arrow_forward, // Ganti dengan ikon yang diinginkan
                              color: Colors.white, // Warna ikon
                            ),
                            iconSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                RichText(
                  text: TextSpan(
                    text: "Don't have any account? ",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create',
                        style: const TextStyle(
                          color: Color(0xFF0E4749),
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Tambahkan navigasi ke halaman lain di sini
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
