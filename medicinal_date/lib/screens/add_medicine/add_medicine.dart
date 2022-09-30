import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class addMedicine extends StatefulWidget {
  const addMedicine({Key? key}) : super(key: key);

  @override
  State<addMedicine> createState() => _addContactState();
}

class _addContactState extends State<addMedicine> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final obsController = TextEditingController();
  final quantidadeController = TextEditingController();
  final horarioController = MaskedTextController(mask: "00:00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo Remédio"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("Nova agenda registrada");
          }
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
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
                validator: (text) => (text == null || text.length > 3)
                ? "Nome de medicamento muito pequeno."
                : null,
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
                validator: (text) => (text == null || text.length == 0)
                ? "Adicione uma obscervação"
                : null,
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
                validator: (text) => (text == null || text.length == 0)
                ? "adicione pelo menos 1 unidade"
                : null,
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
                validator: (text) => (text == null || text.length != 5)
                ? "Horario invalido"
                : null,
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
