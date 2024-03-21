import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variável que recebe o que é digitado no form
  final valor = TextEditingController();

  // lista que armazena as compras
  List compras = [
    {
      "name": "Macarrão",
      "isBought": false,
    },
    {
      "name": "Arroz",
      "isBought": false,
    },
  ];

  //add um item na lista 
  void addItem(value){
    setState(() {
      compras.add(value);
    });
    valor.clear();
  }

  void remove(index){
    setState(() {
      compras.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de compras', 
        style: GoogleFonts.roboto()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: valor,
              decoration: InputDecoration(
                hintText: 'Digite um item',
                border: OutlineInputBorder()
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 30,
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: () {
                addItem(valor.text);
              },
              child: const Text('Adicionar item')
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: compras.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(compras[index]['name'], 
                      style: GoogleFonts.nunitoSans())
                    ),
                    IconButton(
                      onPressed: () {
                        remove(index);
                      }, 
                      icon: Icon(Icons.delete)
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}