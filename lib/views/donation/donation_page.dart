import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para copiar para área de transferência
import 'package:url_launcher/url_launcher.dart'; // Para abrir link do PIX
import '../../core/constants/palette.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

  // 🔹 Texto da chave PIX (copia e cola)
  static const String pixKey = '00020126360014br.gov.bcb.pix0114528791470001055204000053039865802BR5925BELIEVERS INTERNATIONAL E6008ALVORADA622605224QC48b0MUZ0U0jp6bZx2cB63040379';

  // 🔹 Link PIX para tentar abrir direto no app do banco
  static const String pixLink =
      'pix://pay?pa=00020126360014br.gov.bcb.pix0114528791470001055204000053039865802BR5925BELIEVERS INTERNATIONAL E6008ALVORADA622605224QC48b0MUZ0U0jp6bZx2cB63040379';

  // Função para abrir o link PIX
  Future<void> _openPix() async {
    final Uri uri = Uri.parse(pixLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doações'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Apoie este projeto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Se você deseja apoiar nosso trabalho de tradução e publicação de livros, escaneie o QR Code abaixo ou use o código PIX copia e cola.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/images/qrcode_pix.png', // ✅ QR Code salvo na pasta assets/images/
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Chave PIX \nFavorecido: 52879147 Hercules Jose Henrique Dias de Oliveira\nBanco: CORA SCFI',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),


            // 🔹 Caixa de texto copia e cola com botão copiar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      pixKey,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.blue),
                    tooltip: 'Copiar chave PIX',
                    onPressed: () {
                      Clipboard.setData(const ClipboardData(text: pixKey));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Chave PIX copiada!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            
          ],
        ),
      ),
    );
  }
}
