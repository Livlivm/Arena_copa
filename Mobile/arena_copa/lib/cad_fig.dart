import 'package:flutter/material.dart';

class CadastroFigurinhaPage extends StatefulWidget {
  const CadastroFigurinhaPage({super.key});

  @override
  State<CadastroFigurinhaPage> createState() => _CadastroFigurinhaPageState();
}

class _CadastroFigurinhaPageState extends State<CadastroFigurinhaPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController selecaoController = TextEditingController();
  final TextEditingController camisaController = TextEditingController();
  final TextEditingController figurinhaController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();

  String imagemUrl = "";

  void salvarFigurinha() {
    if (nomeController.text.isEmpty ||
        selecaoController.text.isEmpty ||
        camisaController.text.isEmpty ||
        figurinhaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha todos os campos!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Figurinha cadastrada com sucesso!"),
        backgroundColor: Colors.green,
      ),
    );

    nomeController.clear();
    selecaoController.clear();
    camisaController.clear();
    figurinhaController.clear();
    imagemController.clear();

    setState(() {
      imagemUrl = "";
    });
  }

  void atualizarImagem() {
    setState(() {
      imagemUrl = imagemController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            Image.asset("assets/logo.png", height: 90),

            const SizedBox(height: 14),

            // 🔥 BANNER AGORA ESTILO CARD FIFA
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  bannerCard("assets/j1.png"),
                  bannerCard("assets/j2.png"),
                  bannerCard("assets/j3.png"),
                  bannerCard("assets/j4.png"),
                  bannerCard("assets/j5.png"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              color: const Color(0xFFB5AC9C),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: const Center(
                child: Text(
                  "CADASTRAR FIGURINHA",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            campo("Nome do Jogador", nomeController),
            campo("Seleção", selecaoController),
            campo("Número da Camisa", camisaController),
            campo("Número da Figurinha", figurinhaController),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: imagemController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "URL da imagem (link)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: atualizarImagem,
                    child: const Text("OK"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white38),
              ),
              child: imagemUrl.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, color: Colors.white, size: 50),
                          SizedBox(height: 8),
                          Text(
                            "Cole o link da imagem",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imagemUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: salvarFigurinha,
                icon: const Icon(Icons.save),
                label: const Text(
                  "SALVAR FIGURINHA",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 🔥 CARD ESTILO FIFA PARA BANNER
  Widget bannerCard(String img) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFFF5D76E), Color(0xFFD4AF37)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(img, fit: BoxFit.cover),
        ),
      ),
    );
  }

  // CAMPOS
  static Widget campo(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
