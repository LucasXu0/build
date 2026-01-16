import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/user.dart';
import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Build Runner Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Build Runner Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = '';

  void _runExample() {
    setState(() {
      final userJson = {
        'id': '123',
        'name': 'John Doe',
        'email': 'john@example.com',
        'age': 30,
        'isActive': true,
      };

      final productJson = {
        'id': 'prod-456',
        'name': 'Laptop',
        'price': 999.99,
        'description': 'A high-performance laptop',
        'tags': ['electronics', 'computers', 'productivity'],
        'createdAt': DateTime.now().toIso8601String(),
      };

      final user = User.fromJson(userJson);
      final product = Product.fromJson(productJson);

      final userJsonString = jsonEncode(user.toJson());
      final productJsonString = jsonEncode(product.toJson());

      _output = '''
User Model:
- ID: ${user.id}
- Name: ${user.name}
- Email: ${user.email}
- Age: ${user.age}
- Active: ${user.isActive}

User JSON: $userJsonString

---

Product Model:
- ID: ${product.id}
- Name: ${product.name}
- Price: \$${product.price}
- Description: ${product.description}
- Tags: ${product.tags.join(', ')}

Product JSON: $productJsonString

Code generation successful! ✓
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: _runExample,
              child: const Text('Run JSON Serialization Example'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _output.isEmpty
                      ? 'Press the button to run the example'
                      : _output,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
