import 'package:flutter/material.dart';
import 'package:products_app/product_details.dart';

class Product {
  final String title;
  final String description;
  final double price;
  // Add other properties as needed

  Product({
    required this.title,
    required this.description,
    required this.price,
    // Add other properties as needed
  });
}

class ProductsPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      title: 'Smart Soil Pot',
      description: 'Smart soil analysis housed inside a cute plant pot.',
      price: 39.99,
      // Add other properties as needed
    ),
    Product(
      title: 'Domino Scanner v3',
      description:
          'Quickly count pips and track score so that you can get back to enjoying the game. Domino  Set included.',
      price: 49.99,
      // Add other properties as needed
    ),
    Product(
      title: 'Life Habit Application',
      description: 'Track Groceries, Todos, ect.',
      price: 119.99,
      // Add other properties as needed
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Page'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          // Replace this with your product widget
          return ProductWidget(products[index]);
        },
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Product product;

  ProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailPage(product)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder thumbnail image
            Container(
              height: 100.0, // Adjust the height as needed
              width: double.infinity,
              color: Colors.grey, // Placeholder color
              // Replace the color with an actual Image widget with your image
            ),
            // Title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.description),
            ),
            // Price and Add to Cart button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement add to cart functionality
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
