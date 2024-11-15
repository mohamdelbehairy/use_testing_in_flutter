import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController controller = TextEditingController();

  String resultText = "";
  int? resultLength;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text('Unit Testing',
                style: TextStyle(color: Colors.white))),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter input')),
              const SizedBox(height: 16),
              MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      resultText = reverseText(controller.text);
                      resultLength = lengthText(controller.text);
                    });
                  },
                  child: const Text('Click',
                      style: TextStyle(color: Colors.white))),
              const SizedBox(height: 32),
              if (resultLength != null)
                Text('$resultText . and length is: $resultLength',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}

String reverseText(String text) {
  return text.split('').reversed.join('');
}

int lengthText(String text) {
  return text.length;
}
