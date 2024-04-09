import 'package:boicott/components/ProductCard.dart';
import 'package:boicott/util/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupportListPage extends StatelessWidget {
  SupportListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final supportProducts = Provider.of<DataProvider>(context).supportProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Support products"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                textAlign: TextAlign.left,
                "Find support product based on Company name, Product name or bar code number."),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Coca-cola company or Nestle",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25)))),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(supportProducts.length, (index) {
                  return ProductCard(product: supportProducts[index]);
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
