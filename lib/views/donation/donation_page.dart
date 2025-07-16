import 'package:flutter/material.dart';
import '../../core/constants/palette.dart';

class DonationPage extends StatelessWidget {
  const DonationPage({super.key});

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
              'Se vocêdeseja apoiar nosso trabalho de tradução e publicação de livros, escaneie o QR Code abaixo para fazer uma doação via PIX. contato@editoraamensagem.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: Image.asset(
                'assets/images/qrcode_pix.png', // ✅ Coloque a imagem com esse nome na pasta assets/images/
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Chave PIX (CNPJ)19.721.615/0001-35 -Favorecido Editora A Mensagem -Banco 403 - Cora SCD',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
