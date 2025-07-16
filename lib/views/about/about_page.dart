import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/palette.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  void _abrirWhatsApp() async {
    final url = Uri.parse('https://wa.me/5551981444489'); // Substitua com seu número com DDI
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o WhatsApp.';
    }
  }

  void _abrirMapa() async {
    final url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=Rua+Santo+Amaro+227,+Stella+Maris,+Alvorada+-+RS');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o Google Maps.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quem Somos'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              '📍 Endereço:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Rua Santo Amaro, 227\nStella Maris, Alvorada - RS\nCEP 94856-230',
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _abrirMapa,
              icon: const Icon(Icons.map),
              label: const Text('Ver no Google Maps'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _abrirWhatsApp,
              icon: const Icon(Icons.chat),
              label: const Text('Falar no WhatsApp'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              '📝 Sobre nosso trabalho:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Somos uma equipe dedicada à tradução, preservação e disseminação das mensagens de fé. '
              'Nosso objetivo é tornar acessíveis livros e sermões que inspiram vidas, trazendo clareza e profundidade espiritual para quem busca conhecer mais. '
              'Cada obra é cuidadosamente revisada e preparada com responsabilidade e zelo pela originalidade do conteúdo.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
