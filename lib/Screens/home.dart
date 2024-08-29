import 'package:chips_collection/Model/product.dart';
import 'package:chips_collection/Widgets/avatar_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> chipsInCart = [];
  List<Product> chipItems = [
    Product(
      id: '1',
      title: 'Sweet & Spicy Chips',
      description: 'Sweet & Spicy Chips',
      category: 'Spicy',
      price: 4.49,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '2',
      title: 'Salt & Vinegar Chips',
      description: 'Salt & Vinegar Chips',
      category: 'Vinegar',
      price: 3.99,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '3',
      title: 'BBQ Chips',
      description: 'BBQ Chips',
      category: 'BBQ',
      price: 4.49,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '4',
      title: 'Sour Cream & Onion Chips',
      description: 'Sour Cream & Onion Chips',
      category: 'Sour Cream',
      price: 3.99,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '5',
      title: 'Cheddar & Sour Cream Chips',
      description: 'Cheddar & Sour Cream Chips',
      category: 'Cheddar',
      price: 4.49,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '6',
      title: 'Jalapeno Chips',
      description: 'Jalapeno Chips',
      category: 'Jalapeno',
      price: 3.99,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '7',
      title: 'Classic Chips',
      description: 'Classic Chips',
      category: 'Classic',
      price: 4.49,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '8',
      title: 'Ranch Chips',
      description: 'Ranch Chips',
      category: 'Ranch',
      price: 3.99,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '9',
      title: 'Dill Pickle Chips',
      description: 'Dill Pickle Chips',
      category: 'Dill Pickle',
      price: 4.49,
      imageUrl: 'assets/product/chips.jpg',
    ),
    Product(
      id: '10',
      title: 'Kettle Chips',
      description: 'Kettle Chips',
      category: 'Kettle',
      price: 3.99,
      imageUrl: 'assets/product/chips.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.13,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chips',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 34.0,
                  ),
                ),
                Text(
                  'Collection',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.onSurface,
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${chipItems.length} items',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Filter logic here
                        },
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 30.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  // Grid view of product cards
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                    ),
                    itemCount: chipItems.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: chipItems[index],
                        onAddToCart: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              content: Container(
                                height: 40.0,
                                alignment: Alignment.center,
                                child: Text(
                                  '${chipItems[index].title} added to cart',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          );

                          setState(() {
                            chipsInCart.add(chipItems[index]);
                            chipItems.remove(chipItems[index]);
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            if (chipsInCart.isNotEmpty)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100.0,
                  margin: const EdgeInsets.only(top: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Text(
                              '${chipsInCart.length}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          const Column(
                            children: [
                              Text("Cart",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                '1 item',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      AvatarGroup(
                        avatars: chipsInCart
                            .map((product) => product.imageUrl)
                            .toList(),
                        avatarSize: 50.0,
                        maxVisibleAvatars: 4,
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.asset(
              product.imageUrl,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          // Title at the top
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Text(
              product.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Category container below the title
          Positioned(
            top: 70,
            // left: 16,
            // right: 16,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                product.category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          // Price and Add to Cart button at the bottom
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: onAddToCart,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
