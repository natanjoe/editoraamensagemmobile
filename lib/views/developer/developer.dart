import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  Future<void> _openWhatsApp() async {
    final Uri whatsappUrl = Uri.parse(
      'https://wa.me/5585996382719?text=Olá,%20tenho%20interesse%20em%20informações%20sobre%20o%20desenvolvimento%20de%20um%20sistema.',
    );
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir o WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o sistema'),
        backgroundColor: const Color.fromARGB(255, 68, 36, 122),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Desenvolvido por:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Estudio App Games'),
            const SizedBox(height: 20),
            const Text(
              'Informações sobre o sistema:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Este aplicativo foi desenvolvido para gerenciar tarefas de envio e pedidos de mensagens, tornando mais acessível a mensagem do sétimo anjo de apocalipse 10:7. '
              'Se você quiser um sistema como esse, para você, sua igreja ou comércio entre em contato:',
            ),
            const SizedBox(height: 20),
            const Text('📧 Email: estudioappgmes@gmail.com'),
            const SizedBox(height: 8),

            // 🔹 WhatsApp clicável
            RichText(
              text: TextSpan(
                text: '📱 WhatsApp: ',
                style: const TextStyle(color: Colors.black, fontSize: 16),
                children: [
                  TextSpan(
                    text: '(85) 99638-2719',
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _openWhatsApp();
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
