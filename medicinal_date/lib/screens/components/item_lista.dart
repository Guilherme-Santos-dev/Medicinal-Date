import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicinal_date/model/Medicine.dart';
import 'package:medicinal_date/model/list_of_medicine.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  Medicine medicine; 
  ItemList({super.key,
  required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [       
            Icon(
              Icons.access_time_outlined
            ),        
            SizedBox(
              width: 20,
              
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(medicine.nome),
                Text(medicine.horario),
              ],
            )
          ],
        ),
      ],

    );
    
  }
}