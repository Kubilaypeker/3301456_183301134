import 'package:hive/hive.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  late String marka;

  @HiveField(1)
  late String fiyat;

  @HiveField(2)
  late String kod;

  @HiveField(3)
  late String photoUrl;
}


class hiveService {
  final cartBox = Hive.box('shopping_cart');

  void addItemToCart(Product product) {
    cartBox.add(product);
  }

  List<Product> getItemsOnCart() {
    final List<Product> cartItems = [];
    for (var i = 0; i < cartBox.length; i++) {
      final product = cartBox.getAt(i) as Product;
      cartItems.add(product);
    }
    return cartItems;

  }

  void removeItem(int index) {
    cartBox.deleteAt(index);
  }
}
