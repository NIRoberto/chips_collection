import 'package:chips_collection/Model/product.dart';
import 'package:chips_collection/data/data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  final List<Product> productsInCart;

  const CartScreen({
    super.key,
    required this.productsInCart,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                  'Cart',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 34.0,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () {
                    context.go("/");
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ProductInCard(
                          product: products[index],
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Amount',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                '\$04.00',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.5),
                          thickness: 1.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    'USD 100.00',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 35.0,
                                    ),
                                  ),
                                ],
                              ),
                              Image(
                                width: 50,
                                height: 50,
                                image: AssetImage('assets/product/chips.jpg'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Make Payment',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: const Text(
                            'Pay',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductInCard extends StatelessWidget {
  final Product product;

  const ProductInCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(product.imageUrl),
                radius: 40.0,
              ),
              const SizedBox(width: 30.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    product.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              '\$${product.price}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
