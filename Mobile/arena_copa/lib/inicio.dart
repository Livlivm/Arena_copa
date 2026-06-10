import 'package:flutter/material.dart';
import 'login.dart';
import 'jogos.dart';
import 'figurinhas.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

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
              leading: const Icon(Icons.collections),
              title: const Text("Adicione Figurinhas"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FigurinhasPage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Ver Perfil"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
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
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 50,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.black, size: 18),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),

            Center(child: Image.asset("assets/logo.png", height: 90)),

            const SizedBox(height: 16),

            SizedBox(
              height: 135,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  banner("assets/j1.png"),
                  banner("assets/j2.png"),
                  banner("assets/j3.png"),
                  banner("assets/j4.png"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(child: team(context, "assets/brasil.png")),

                  const SizedBox(width: 10),

                  Expanded(child: team(context, "assets/franca.png")),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "VEJA AS INFORMAÇÕES DOS JOGOS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            faixa(),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FigurinhasPage(),
                        ),
                      );
                    },
                    child: figurinha("assets/cr7.png"),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FigurinhasPage(),
                        ),
                      );
                    },
                    child: figurinha("assets/messi.png"),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FigurinhasPage(),
                        ),
                      );
                    },
                    child: figurinha("assets/modric.png"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "ADICIONE SUAS FIGURINHAS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 12),

            faixa(),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  produto("assets/camisa1.png"),
                  produto("assets/camisa2.png"),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "VEJA AS NOVIDADES DE PRODUTOS",
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget banner(String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(img, width: 120, fit: BoxFit.cover),
      ),
    );
  }

  Widget team(BuildContext context, String img) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JogosPage()),
        );
      },

      child: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget figurinha(String img) {
    return Container(
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
    );
  }

  Widget produto(String img) {
    return Container(
      width: 95,
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFF9C8B2F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(img, fit: BoxFit.contain),
    );
  }

  Widget faixa() {
    return Container(
      height: 12,
      width: double.infinity,
      color: const Color(0xFFB5AC9C),
    );
  }
}
