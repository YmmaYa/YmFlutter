
import 'package:flutter/cupertino.dart';
import 'package:ym_flutter/state/provider/ym_cart_product_model.dart';

class YmProviderCartModel extends ChangeNotifier {
  //私有列表
  final List<YmCartProductModel> _items = [];

  // 获取购物车商品（只读）                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  List<YmCartProductModel> get items => _items;

  //计算总价
  double getTotalPrice(){
    double totalPrice = 0.00;
    totalPrice = items.fold(0.0, (sum, YmCartProductModel product) => sum + (product.price as double? ?? 0.0));
    return totalPrice;
  }

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(YmCartProductModel item) {
    items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}

