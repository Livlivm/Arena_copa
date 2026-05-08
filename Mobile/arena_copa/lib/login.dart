import 'package:flutter/material.dart';
import 'cadastro.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
      ),

      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/brasil.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/franca.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ],
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.4),
                  Colors.white.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.4),
                ],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Image.asset('assets/logo1.png', height: 100),

                  const SizedBox(height: 25),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      border: Border.all(color: Colors.white30),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CadastroScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'NÃO TEM CONTA?',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),

                  _input("E-MAIL"),
                  const SizedBox(height: 15),
                  _input("SENHA", isPassword: true),

                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'ESQUECEU A SENHA?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: 180,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // aqui depois você pode navegar pra home
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'ENTRAR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'ENTRAR COM GOOGLE...',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(Icons.facebook, Colors.blueAccent),
                      const SizedBox(width: 20),
                      _socialIconGoogle(),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _input(String label, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.85),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: color, size: 28),
    );
  }

  Widget _socialIconGoogle() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Icon(Icons.g_mobiledata, color: Colors.red, size: 28),
    );
  }
}
