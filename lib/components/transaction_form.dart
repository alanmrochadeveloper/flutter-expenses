import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  void _submitForm() {
    String title = titleController.text;
    double value = double.parse(valueController.text);
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: valueController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
                  style: TextButton.styleFrom(foregroundColor: Colors.purple),
                  child: const Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
