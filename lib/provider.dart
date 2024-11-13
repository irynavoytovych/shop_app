import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class CounterModel extends ChangeNotifier {
  int counterState = 0;

  void increase([int step = 1]) {
    counterState += step;
    notifyListeners();
  }

  void decrease() {
    if (counterState > 0) {
      counterState -= 1;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CounterModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const NewWidget(),
          const SizedBox(height: 16),
          CounterDisplay(counterValue: model.counterState),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              model.increase();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              model.decrease();
            },
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int counterValue;

  const CounterDisplay({super.key, required this.counterValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$counterValue',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counterModel = context.watch<CounterModel>();

    return Row(
      children: [
        Text(
          'Counter: ${counterModel.counterState}',
          textAlign: TextAlign.center,
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          child: const Text('+'),
          onPressed: () {
            counterModel.increase(2);
          },
        ),
      ],
    );
  }
}