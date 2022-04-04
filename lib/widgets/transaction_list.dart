// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx; 

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
         ? LayoutBuilder(builder: (ctx, constraints) {
           return Column(
        children: <Widget>[
          Text(
            'no transactions added yet', 
            style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
                ),
              ),
        ],
      );
         }) 
      //list view es una columna con un single child scrollview
      //usamos listview.builder para listas largas, porque consume menos porq no renderiza
      //los datos que no se estan mostrando
         : ListView(children: 
                transactions.map((tx) => TransactionItem(
                key: ValueKey(tx.id),
                transaction: tx, 
                deleteTx: deleteTx,
              )).toList(),
         );
      } 
  }

