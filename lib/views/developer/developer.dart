import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  const Developer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o sistema'),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Desenvolvedor:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Natan Joe'),
            SizedBox(height: 20),
            Text(
              'Informações sobre o sistema:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Este aplicativo foi desenvolvido para gerenciar tarefas de envio e pedidos de mensagens, tornando mais acessível a mensagem do sétimo anjo de apocalipse 10:7. '
              'Se você quiser um sistema como esse, para você, sua igreja ou comércio entre em contato:',
            ),
            SizedBox(height: 20),
            Text('📧 Email: estudioappgmes@gmail.com'),
            Text('📱 WhatsApp: (85) 99638-2719'),
          ],
        ),
      ),
    );
  }
}
