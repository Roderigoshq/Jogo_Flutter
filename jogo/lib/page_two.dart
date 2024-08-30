import 'package:flutter/material.dart';
import 'package:jogo/page_three.dart';
import 'package:jogo/providers/numero_provider.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NumberProvider>(context);
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Insira um número para busca',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: searchController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Número para busca',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  int key = int.tryParse(searchController.text) ?? 0;
                  int position = provider.findNumber(key);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Page3(
                        found: position != -1,
                        position: position,
                      ),
                    ),
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