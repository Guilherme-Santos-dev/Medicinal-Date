import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:medicinal_date/model/Medicine.dart';
import 'package:medicinal_date/repository/medicine_repository.dart';

class addMedicine extends StatefulWidget {
  const addMedicine({Key? key}) : super(key: key);

  @override
  State<addMedicine> createState() => _addContactState();
}

class _addContactState extends State<addMedicine> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final observacaoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final horarioController = MaskedTextController(mask: "00:00");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova agenda"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final medicine = Medicine(
              nome: nomeController.text,
              observacao: observacaoController.text,
              quantidade: quantidadeController.text,
              horario: horarioController.text,             
            );
            final result = await MedicineRepository.insertMedicine(medicine.toMap());
            String message;
            if (result != 0) {
              message = "Agenda criada";
            } else {
              message = "Não foi possivel criar a agenda";
            }
            final snack = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snack);

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
                validator: (text) => (text == null || text.length < 4)
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
                controller: observacaoController,
                validator: (text) => (text == null || text.length == 0 )
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
                validator: (text) => (text == null || text.length < 1)
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
