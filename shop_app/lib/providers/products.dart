import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Laptop Table',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://n3.sdlcdn.com/imgs/g/k/3/GENCLIQ-Laptop-Table-For-Upto-SDL836374459-2-5384f.jpegjpg',
    ),
    Product(
      id: 'p3',
      title: 'Midi Keyboard',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl: 'https://www.musicworks.co.nz/greentree/images/UMK49_LGE.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Laptop',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/zvVpUjgjRxYid2G2cPzrah-1200-80.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Mouse',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.OH1xJgTAw_QPTep956LdhQHaHa%26pid%3DApi&f=1',
    ),
    Product(
      id: 'p6',
      title: 'Mouse',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.OH1xJgTAw_QPTep956LdhQHaHa%26pid%3DApi&f=1',
    ),
    Product(
      id: 'p7',
      title: 'Mouse',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.OH1xJgTAw_QPTep956LdhQHaHa%26pid%3DApi&f=1',
    ),
    Product(
      id: 'p8',
      title: 'Mouse',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.OH1xJgTAw_QPTep956LdhQHaHa%26pid%3DApi&f=1',
    ),
    Product(
      id: 'p9',
      title: 'Tech Hammer',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://i.pinimg.com/736x/b1/a2/05/b1a205ed5262fc9d958bb5c53812475b--latest-gadgets-new-gadgets.jpg',
    ),
    Product(
      id: 'p10',
      title: 'Trumpet',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl: 'https://i.ebayimg.com/images/i/181621925294-0-1/s-l1000.jpg',
    ),
    Product(
      id: 'p11',
      title: 'Saxophone',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://www.1800usaband.com/uploads/images/TenorSax-YTS62III.jpg',
    ),
    Product(
      id: 'p12',
      title: 'Keyboard',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://www.micwil.com/images/gallery/solidtek_compact_keyboard_with_trackball_p1_1200x750.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite!).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
