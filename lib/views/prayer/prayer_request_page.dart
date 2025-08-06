import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PrayerRequestPage extends StatefulWidget {
   const PrayerRequestPage({super.key});

  @override
  State<PrayerRequestPage> createState() => _PrayerRequestPageState();
}

class _PrayerRequestPageState extends State<PrayerRequestPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _whatsapp = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final city = _cityController.text.trim();
      final whatsapp = _whatsapp.text.trim();
      final description = _descriptionController.text.trim();

      // Criando objeto no Back4App
      final prayerRequest = ParseObject('PrayerRequests')
        ..set('name', name)
        ..set('email', email)
        ..set('city', city)
        ..set('whatsapp', whatsapp)
        ..set('description', description);

      final response = await prayerRequest.save();

      setState(() => _isLoading = false);

      if (response.success) {
        _showDialog('Pedido enviado',
            'Obrigado, $name!\nRecebemos seu pedido de oração.');
        _formKey.currentState!.reset();
      } else {
        _showDialog('Erro', 'Não foi possível enviar seu pedido. Tente novamente.');
      }
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  String? _requiredValidator(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe seu(a) $fieldName';
    }
    return null;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _whatsapp.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido de Oração'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => _requiredValidator(value, 'nome'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => _requiredValidator(value, 'e-mail'),
              ),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'Cidade'),
                validator: (value) => _requiredValidator(value, 'cidade'),
              ),
              TextFormField(
                controller: _whatsapp,
                decoration: const InputDecoration(labelText: 'WhatsApp'),
                validator: (value) => _requiredValidator(value, 'whatsapp'),
              ),
              TextFormField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Pedido de oração'),
                maxLines: 4,
                validator: (value) =>
                    _requiredValidator(value, 'pedido de oração'),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Enviar pedido'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
