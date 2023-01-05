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
        child: ListView.builder(
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
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'R\$ ${transaction.value.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        transaction.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
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
        ),);
  }
}
