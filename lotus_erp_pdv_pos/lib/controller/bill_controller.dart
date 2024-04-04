import 'package:get/get.dart';

import '../models/collections/produto.dart';

class BillController extends GetxController {
  var productsInCart = [].obs;
  var total = 0.obs;

  // Adiciona um item no carrinho
  void addProductInCart(produto product) {
    /* if (productsInCart.isEmpty) {
      productsInCart.add({'product': product, 'quantity': 1});
    }*/
    var index = productsInCart.indexWhere(
        (element) => element['product'].id_produto == product.id_produto);
    if (index == -1) {
      productsInCart.add({'product': product, 'quantity': 1});
    } else {
      productsInCart[index]['quantity'] += 1;
    }
    update();
    productsInCart.refresh();
    getQuantityTotal();
  }

  // Remove um item do carrinho
  void removeProductInCart(produto product) {
    var index = productsInCart.indexWhere(
        (element) => element['product'].id_produto == product.id_produto);
    if (index != -1) {
      productsInCart[index]['quantity'] -= 1;
      if (productsInCart[index]['quantity'] == 0) {
        productsInCart.removeAt(index);
      }
    }
    update();
  }

  // Retorna o total
  double getTotal() {
    var total = 0.0;
    if (productsInCart.isEmpty) return 0.0;

    for (var element in productsInCart) {
      total += element['product'].pvenda * element['quantity'];
    }
    return total;
  }

  // Retorna a quantidade do produto específico
  int getQuantity(produto product) {
    var index = productsInCart.indexWhere(
        (element) => element['product'].id_produto == product.id_produto);
    if (index == -1) {
      return 0;
    } else {
      return productsInCart[index]['quantity'];
    }
  }

  // Retorna a quantidade total dos produtos
  void getQuantityTotal() {
    if (productsInCart.isEmpty) return;
    total.value = 0;
    for (var element in productsInCart) {
      total += element['quantity'] as int;
    }
    update();
  }

  // Limpa o carrinho de compras
  void clearProductsInCart() {
    productsInCart.clear();
    total.value = 0;
    update();
  }
}
