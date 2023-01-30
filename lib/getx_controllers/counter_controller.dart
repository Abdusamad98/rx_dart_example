import 'package:get/get.dart';

class CounterController extends GetxController {

  CounterController(){
    fetchProducts();
  }

  final RxInt count = 0.obs;

  final Rx<MyCustomModel> model = MyCustomModel().obs;

  final RxBool isLoading = false.obs;

  final RxList products = [].obs;

  fetchProducts() async {

    products.value = [MyCustomModel(),MyCustomModel()];
  }


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
