import 'package:get/get.dart';

class CounterController extends GetxController {
  final RxInt count = 0.obs;

  final Rx<MyCustomModel> model = MyCustomModel().obs;

  final RxBool isLoading = false.obs;

  increment() => count.value++;

  decrement() => count.value--;

  showLoader() {
    isLoading.value = true;
  }

  hideLoader() {
    isLoading.value = false;
  }




}

class MyCustomModel {}
