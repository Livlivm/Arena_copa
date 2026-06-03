import 'package:flutter/material.dart';
import 'inicio.dart';

class JogosPage extends StatelessWidget {
  const JogosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB9B5A8),

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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  const SizedBox(height: 35),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Builder(
                          builder: (context) {
                            return IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 28,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),

                        const Spacer(),

                        Image.asset("assets/logo.png", height: 70),

                        const Spacer(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    height: 135,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        banner("assets/j1.png"),
                        banner("assets/j2.png"),
                        banner("assets/j3.png"),
                        banner("assets/j4.png"),
                        banner("assets/j5.png"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),

            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  "JOGOS SEPARADOS POR GRUPOS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Container(
                width: 220,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "1° RODADA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  "GRUPO A",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            jogoCard(
              estadio: "AKRON 11/06",
              horario: "QUINTA-FEIRA 16:00",
              bandeira1: "assets/mexico.webp",
              bandeira2: "assets/africa.webp",
              faixaColor: Colors.green,
            ),

            const SizedBox(height: 18),

            jogoCard(
              estadio: "AZTECA 11/06",
              horario: "QUINTA-FEIRA 23:00",
              bandeira1: "assets/coreia.png",
              bandeira2: "assets/tcheca.webp",
              faixaColor: Colors.red,
            ),

            const SizedBox(height: 28),

            // GRUPO B
            Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  "GRUPO B",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            jogoCard(
              estadio: "TORONTO FIELD 12/06",
              horario: "SEXTA-FEIRA 16:00",
              bandeira1: "assets/canada.png",
              bandeira2: "assets/bosniapng.png",
              faixaColor: Colors.green,
            ),

            const SizedBox(height: 18),

            jogoCard(
              estadio: "SANTA CLARA 13/06",
              horario: "SÁBADO 16:00",
              bandeira1: "assets/catar.webp",
              bandeira2: "assets/suica.png",
              faixaColor: Colors.red,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget banner(String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Image.asset(img, width: 72, fit: BoxFit.cover),
    );
  }

  Widget jogoCard({
    required String estadio,
    required String horario,
    required String bandeira1,
    required String bandeira2,
    required Color faixaColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 95,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          estadio,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 9,
                          ),
                        ),
                        Text(
                          horario,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        bandeira(bandeira1),

                        const Text(
                          "X",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 38,
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        bandeira(bandeira2),
                      ],
                    ),

                    const Spacer(),

                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "VER ESCALAÇÃO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(width: 28, height: 95, color: faixaColor),
        ],
      ),
    );
  }

  Widget bandeira(String img) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(radius: 22, backgroundImage: AssetImage(img)),
    );
  }
}
