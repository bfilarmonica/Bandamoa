
import 'package:flutter/material.dart';

void main() => runApp(TranspositorApp());

class TranspositorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TranspositionScreen(),
    );
  }
}

class TranspositionScreen extends StatefulWidget {
  @override
  _TranspositionScreenState createState() => _TranspositionScreenState();
}

class _TranspositionScreenState extends State<TranspositionScreen> {
  String selectedVoice = 'Soprano';
  final voices = ['Soprano', 'Contralto', 'Tenor', 'Baixo'];

  final partituraImages = {
    'Soprano': 'assets/asa_branca/soprano.png',
    'Contralto': 'assets/asa_branca/contralto.png',
    'Tenor': 'assets/asa_branca/tenor.png',
    'Baixo': 'assets/asa_branca/baixo.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transpositor de Partitura')),
      body: Column(
        children: [
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedVoice,
            onChanged: (String? value) {
              setState(() {
                selectedVoice = value!;
              });
            },
            items: voices.map((voice) {
              return DropdownMenuItem(
                value: voice,
                child: Text(voice),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Image.asset(partituraImages[selectedVoice]!),
          ),
        ],
      ),
    );
  }
}
