import 'package:chips_collection/Model/category.dart';
import 'package:chips_collection/Model/product.dart';
import 'package:chips_collection/Widgets/avatar_group.dart';
import 'package:chips_collection/Widgets/product.dart';
import 'package:chips_collection/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({
    super.key,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Category selectedCategory = categories[0];
  List<Product> chipsInCart = [];

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
                  'Order From The',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 34.0,
                  ),
                ),
                Text(
                  'Best Of Snacks',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                context.go("/");
              },
              icon: const Icon(
                Icons.line_style_outlined,
              ),
            )
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Filter categories
              SizedBox(
                height: 60.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return FilterCategory(
                      category: categories[index],
                      index: index,
                      isSelected: selectedCategory == categories[index],
                      onTap: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: selectedCategory.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 28.0,
                        ),
                        children: [
                          TextSpan(
                            text: ' Collections',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      size: 30.0,
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              // Products
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Expanded(
                  child: PageView.builder(
                    pageSnapping: true,
                    itemCount: selectedCategory.name == 'All'
                        ? products.length
                        : products
                            .where((element) =>
                                element.category == selectedCategory.name)
                            .length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        onTap: () {
                          context.go(
                              '/products/${selectedCategory.name == 'All' ? products[index].id : products.where((element) => element.category == selectedCategory.name).toList()[index].id}',
                              extra: {
                                'product': selectedCategory.name == 'All'
                                    ? products[index]
                                    : products
                                        .where((element) =>
                                            element.category ==
                                            selectedCategory.name)
                                        .toList()[index]
                              });
                        },
                        paddingH: 24.0,
                        paddingV: 12.0,
                        titleFontSize: 28.0,
                        paddingIcon: 16.0,
                        borderRadius: 40.0,
                        onAddToCart: () {
                          setState(() {
                            chipsInCart.add(selectedCategory.name == 'All'
                                ? products[index]
                                : products
                                    .where((element) =>
                                        element.category ==
                                        selectedCategory.name)
                                    .toList()[index]);
                          });
                        },
                        product: selectedCategory.name == 'All'
                            ? products[index]
                            : products
                                .where((element) =>
                                    element.category == selectedCategory.name)
                                .toList()[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        if (chipsInCart.isNotEmpty)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                context.go('/cart', extra: {'products': chipsInCart});
              },
              child: Container(
                height: 100.0,
                margin: const EdgeInsets.only(top: 2.0),
                padding: const EdgeInsets.all(20.0),
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
                            Text(
                              "Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
            ),
          ),
      ]),
    );
  }
}

class FilterCategory extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final int index;
  final VoidCallback onTap;

  const FilterCategory({
    super.key,
    required this.index,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.onSurface
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            if (index != 0)
              Icon(
                category.icon,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
              ),
            const SizedBox(width: 8.0),
            (isSelected || index == 0)
                ? Text(
                    category.name,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                : const SizedBox(
                    height: 0,
                    width: 30,
                  )
          ],
        ),
      ),
    );
  }
}
