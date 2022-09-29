import 'package:flutter/material.dart';

class addMedicine extends StatefulWidget {
  const addMedicine({Key? key}) : super(key: key);

  @override
  State<addMedicine> createState() => _addContactState();
}

class _addContactState extends State<addMedicine> {
  final _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final obsController = TextEditingController();
  final quantidadeController = TextEditingController();
  final horarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Remédio"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("TA OK ");
          }
        },
        child: const Icon(
          Icons.save,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "NOVA AGENDA",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: nomeController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nome do remédio"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: obsController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Observação"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: quantidadeController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Quantidade"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: horarioController,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Horário do remédio"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
