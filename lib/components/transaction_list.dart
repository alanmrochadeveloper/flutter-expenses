import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  const TransactionList(this._transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: _transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma transação cadastrada!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              // com esse recurso aqui, a construção da lista é dinâmica, e vai construindo a view de vários elemento conforme o usuário vai rolando a lista pra baixa.
              itemCount: _transactions.length,
              itemBuilder: (ctx, index) {
                final transaction = _transactions[index];
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${transaction.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            transaction.title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            DateFormat('d MMM y').format(transaction.date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
