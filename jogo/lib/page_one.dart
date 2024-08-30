import 'package:flutter/material.dart';
import 'package:jogo/providers/numero_provider.dart';
import 'package:provider/provider.dart';

import 'page_two.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NumberProvider>(context);

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Insira 8 números',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ...List.generate(
              2,
              (row) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: List.generate(4, (index) {
                    int fieldIndex = row * 4 + index;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '${fieldIndex + 1}',
                          ),
                          onChanged: (value) {
                            int intValue = int.tryParse(value) ?? 0;
                            provider.setNumber(fieldIndex, intValue);
                          },
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  provider.sortNumbers();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page2()),
                  );
                },
                child: Text('Entrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
