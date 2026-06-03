import 'package:flutter/material.dart';
import 'inicio.dart';
import 'jogos.dart';

void main() {
  runApp(const ArenaCopaApp());
}

class ArenaCopaApp extends StatelessWidget {
  const ArenaCopaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFC5A059),
      ),
      home: const CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Center(
                child: Text(
                  "MENU",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Início"),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InicioPage()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.flag_rounded),
              title: const Text("Infos Jogos"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JogosPage()),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Ver Perfil"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configurações"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      body: Stack(
        children: [
          // FUNDO
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

          // ESCURECIMENTO
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.3),
                  Colors.white.withValues(alpha: 0.1),
                  Colors.black.withValues(alpha: 0.4),
                ],
              ),
            ),
          ),

          // CONTEÚDO
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // LOGO
                  Image.asset('assets/logo1.png', height: 100),

                  const SizedBox(height: 25),

                  // TÍTULO
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      border: Border.all(color: Colors.white30),
                      borderRadius: BorderRadius.circular(4),
                    ),

                    child: const Text(
                      'CADASTRE-SE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // CAMPOS
                  _buildInputField(label: 'NOME COMPLETO:'),

                  _buildInputField(label: 'E-MAIL:'),

                  _buildInputField(
                    label: 'DATA DE NASCIMENTO:',
                    hint: '  /  /  ',
                  ),

                  _buildInputField(label: 'ENDEREÇO:'),

                  const SizedBox(height: 30),

                  // BOTÃO
                  SizedBox(
                    width: 200,
                    height: 50,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InicioPage(),
                          ),
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.9),

                        foregroundColor: Colors.black,

                        elevation: 10,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      child: const Text(
                        'CRIAR CONTA',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({required String label, String? hint}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),

      child: TextField(
        style: const TextStyle(color: Colors.black),

        decoration: InputDecoration(
          labelText: label,
          hintText: hint,

          labelStyle: const TextStyle(
            color: Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),

          hintStyle: const TextStyle(color: Colors.black38),

          filled: true,

          fillColor: Colors.white.withValues(alpha: 0.75),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),

            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),

            borderSide: const BorderSide(color: Colors.white24),
          ),
        ),
      ),
    );
  }
}
