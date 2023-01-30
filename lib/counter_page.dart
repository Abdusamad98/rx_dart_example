import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_dart_example/getx_controllers/counter_controller.dart';
import 'package:rx_dart_example/new_screen.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    print("CURRENT THEME:${Get.theme}");
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX example"),
      ),
      body: Column(
        children: [
          Obx(
            () => Center(
              child: Text(counterController.count.value.toString()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                counterController.increment();
              },
              child: const Text("Increment")),
          ElevatedButton(
              onPressed: () {
                counterController.decrement();
              },
              child: const Text("Decrement")),
          ElevatedButton(
              onPressed: () {
                  Get.to(NewScreen());
                // Get.defaultDialog(
                //     title: "Alerty",
                //     titleStyle: TextStyle(fontSize: 34),
                //     actions: [
                //       TextButton(onPressed: () {}, child: Icon(Icons.add))
                //     ]);
              },
              child: const Text("New Screen"))
        ],
      ),
    );
  }
}
