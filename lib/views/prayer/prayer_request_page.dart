import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrayerRequestPage extends StatefulWidget {
  const PrayerRequestPage({Key? key}) : super(key: key);

  @override
  State<PrayerRequestPage> createState() => _PrayerRequestPageState();
}

class _PrayerRequestPageState extends State<PrayerRequestPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final city = _cityController.text.trim();
      final description = _descriptionController.text.trim();

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Pedido enviado'),
          content: Text('Obrigado, $name!\nRecebemos seu pedido de oração.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _formKey.currentState!.reset();
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
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
                controller: _descriptionController,
                decoration:
                    const InputDecoration(labelText: 'Pedido de oração'),
                maxLines: 4,
                validator: (value) =>
                    _requiredValidator(value, 'pedido de oração'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
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
