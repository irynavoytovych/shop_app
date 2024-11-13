import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'ГОДИННИК THE LONGINES MASTER COLLECTION',
      price: 17836.5,
      description: 'Колекція Longines Master Collection ідеально втілює годинникову майстерність і непідвладну часу елегантність марки "крилатого пісочного годинника". ',
      imagePath: 'https://fs5.deka.ua/photo/goods/popup/27/426025/426025_20240112_2000_2000_watch_collection_longines_master_collection_l2_844_8_71_2_1704445217_thumbnail.png',
    ),
    Product(
      name: 'Окуляри FLETCHER 1',
      price: 39.99,
      description: 'Відтворюючи атмосферу цього сезону в моді одягу, Specscart представляє ці блискучі та глянцеві чорні круглі окуляри з тонким матовим покриттям по всій оправі. Сідловина рівномірно розподіляє вагу на ваш ніс, а прозорі носові подушечки розширюють поле зору. Подвійні штифтові деталі на краю оправи з контрастними смугами біля петель і на кінчиках дужок додають базовим чорним окулярам яскравості. Виготовлені з ацетату рослинного походження, вони більш довговічні, гнучкі, міцні, зручні та стильні, ніж звичайний пластик, а також піддаються біологічному розкладанню. Отримайте їх із покриттям синього світла для посиленого захисту від шкідливих синіх променів від різних технічних екранів.',
      imagePath: 'https://specscart.co.uk/media/catalog/product/a/9/a97008f-1-1.webp',
    ),
    Product(
      name: 'Чоловіча толстовка з капюшоном',
      price: 21.99,
      description: 'FRUIT OF THE LOOM CLASSIC HOODED SWEAT. Вона зручна, стильна.',
      imagePath: 'https://footbolki.net/sites/default/files/styles/webp_originalnyy_razmer/public/2022-04/62-208-0-34.jpg.webp?itok=4aSyMcOY',
    ),
    Product(
      name: 'Чоловічі кросівки New Balance',
      price: 100.00,
      description: 'Чоловічі кросівки New Balance 574 ML574EVN 40.5 (7.5US) 25.5 см Сині (195907805978)',
      imagePath: 'https://content2.rozetka.com.ua/goods/images/big/311515289.jpg',
    ),
  ];

  final List<Product> _cart = [];
  List<Product> get shop => _shop;
  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart (Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}