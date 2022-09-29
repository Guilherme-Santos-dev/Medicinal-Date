import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          )
        ],
        leadingWidth: 20,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical:20,
          horizontal: 2,
        ),
      ),
    );
  }
}
