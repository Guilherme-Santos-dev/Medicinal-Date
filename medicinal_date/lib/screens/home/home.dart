import 'package:flutter/material.dart';
import 'package:medicinal_date/model/list_of_medicine.dart';
import 'package:medicinal_date/model/Medicine.dart';
import 'package:medicinal_date/repository/medicine_repository.dart';
import 'package:medicinal_date/screens/components/item_lista.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var medicine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text("Medical date"),
      ),
      body: FutureBuilder(
        future: MedicineRepository.findALL(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data != null && snapshot.hasData) {
            medicine = snapshot.data! as List<Medicine>;
            return Container(
              margin: const EdgeInsets.all(16),
              child: RefreshIndicator(
                onRefresh: _refresh,
                color: Colors.green,
                child: ListView.separated(
                  itemCount: medicine.length,
                  itemBuilder: (_, index) {
                    return ItemList(
                      medicine: medicine[index],
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const Divider();
                  },
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Não existem agendas"),
            );
          }
        },
      ),
    );
  }

  Future<void> _refresh() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    medicine = await MedicineRepository.findALL();
    setState(() {});
  }
}
