import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transactions.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transactions = [
    Transaction(
        id: 't1',
        title: 'Novo Tênis de Corrida',
        value: 310.76,
        date: DateTime.now()),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Conta de algo',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Conta de qualquer outra coisa',
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Conta de qualquer coisa 2',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(((p0, p1) {
            // TODO implementar mais tarde
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais 1'),
        actions: [
          IconButton(
              onPressed: () {
                print('pressed');
                _openTransactionFormModal(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfica'),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('pressed floating action button');
          _openTransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
