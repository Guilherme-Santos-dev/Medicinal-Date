import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicinal_date/model/Medicine.dart';
import 'package:medicinal_date/model/list_of_medicine.dart';
import 'package:flutter/material.dart';
import 'package:medicinal_date/screens/edit_medicine/edit_medicine.dart';

class ItemList extends StatelessWidget {
  Medicine medicine;
  ItemList({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.access_time_outlined),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(medicine.nome),
                  Text(medicine.horario),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => editMedicine(medicine: medicine),
                ),
              );
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
    );
  }
}
