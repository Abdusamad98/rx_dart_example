import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_dart_example/getx_controllers/counter_controller.dart';
import 'package:rx_dart_example/main.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());
    return Scaffold(
        body: Column(
      children: [
        Center(child: Text(counterController.count.toString())),
        ElevatedButton(
            onPressed: () {
              Get.snackbar("Hormela", "Vashshi oson");
            },
            child: Text("SnackBar")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                isDark = !isDark;
                Get.changeTheme(
                    isDark ? AppTheme.lightTheme : AppTheme.darkTheme);
              });

            },
            child: Text("Change theme"))
      ],
    ));
  }
}
