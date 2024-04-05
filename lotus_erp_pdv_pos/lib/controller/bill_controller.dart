import 'package:get/get.dart';
import 'package:lotus_erp_pdv_pos/services/dependencies.dart';

import '../models/collections/produto.dart';

class BillController extends GetxController {
  var pesageController = Dependencies.weightController();
  var productsInCart = [].obs;
  var productsWeight = [].obs;
  var cartShopping = [].obs;
  var total = 0.obs;

  // adiciona um item no carrinho
  void addProductInCart(produto product) {
    if (product.venda_kg == 0) {
      var index = productsInCart.indexWhere(
          (element) => element['product'].id_produto == product.id_produto);
      if (index == -1) {
        productsInCart.add({'product': product, 'quantity': 1});
      } else {
        productsInCart[index]['quantity'] += 1;
      }
      update();
      productsInCart.refresh();
    } else {
      productsWeight
          .add({'product': product, 'quantity': pesageController.weight.value});
      update();
      productsWeight.refresh();
    }
    getQuantityTotal();
  }

  // Retorna o total
  double getTotal() {
    var total = 0.0;

    if (productsInCart.isNotEmpty) {
      for (var element in productsInCart) {
        total += element['product'].pvenda * element['quantity'];
      }
    }
    if (productsWeight.isNotEmpty) {
      for (var element in productsWeight) {
        total += element['product'].pvenda * element['quantity'];
      }
    }
    return total;
  }

  // Retorna a quantidade do produto específico
  int getQuantity(produto product) {
    if (product.venda_kg == 0) {
      var index = productsInCart.indexWhere(
          (element) => element['product'].id_produto == product.id_produto);
      if (index == -1) {
        return 0;
      } else {
        return productsInCart[index]['quantity'];
      }
    } else {
      var products = productsWeight.where(
          (element) => element['product'].id_produto == product.id_produto);
      return products.length;
    }
  }

  // Junta duas listas de produtos que estão no carrinho
  void joinCart() {
    cartShopping.clear();
    cartShopping.addAll(productsInCart);
    cartShopping.addAll(productsWeight);
    update();
  }

  // Retorna a quantidade total dos produtos
  void getQuantityTotal() {
    total.value = 0;

    if (productsInCart.isNotEmpty) {
      for (var element in productsInCart) {
        total += element['quantity'] as int;
      }
    }

    if (productsWeight.isNotEmpty) {
      total += productsWeight.length;
    }
    update();
  }

  // Remove um item do cartShopping ou diminua caso tenha quantity > 0
  // diminuindo também na sua respectiva lista inicial
  void removeProductIncartShopping(produto product) {
    if (cartShopping.isNotEmpty) {
      if (product.venda_kg == 1) {
        var index = productsWeight.indexWhere(
            (element) => element['product'].id_produto == product.id_produto);

        var indexcart = cartShopping.indexWhere(
            (element) => element['product'].id_produto == product.id_produto);

        if (indexcart != -1) {
          cartShopping.removeAt(indexcart);
        }

        if (index != -1) {
          productsWeight.removeAt(index);
        }
      } else {
        var index = productsInCart.indexWhere(
            (element) => element['product'].id_produto == product.id_produto);

        var indexcart = cartShopping.indexWhere(
            (element) => element['product'].id_produto == product.id_produto);

        if (indexcart != -1) {
          if (cartShopping[indexcart]['quantity'] > 1) {
            cartShopping[indexcart]['quantity'] -= 1;
          } else {
            cartShopping.removeAt(indexcart);
            productsInCart.removeAt(index);
          }
        }
      }

      getQuantityTotal();
      update();
      cartShopping.refresh();
      productsWeight.refresh();
      productsInCart.refresh();
    }
  }

  // Limpa o carrinho de compras
  void clearProductsInCart() {
    productsInCart.clear();
    productsWeight.clear();
    total.value = 0;
    update();
  }
}
