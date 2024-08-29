import 'package:chips_collection/Model/category.dart';
import 'package:chips_collection/Model/product.dart';
import 'package:flutter/material.dart';

const List<Category> categories = [
  Category(id: "0", name: "All", icon: Icons.fastfood),
  Category(id: '1', name: 'Burgers', icon: Icons.lunch_dining),
  Category(id: '2', name: 'Pizza', icon: Icons.local_pizza),
  Category(id: '3', name: 'Salads', icon: Icons.eco),
  Category(id: '4', name: 'Desserts', icon: Icons.cake),
  Category(id: '5', name: 'Drinks', icon: Icons.local_drink),
];

List<Product> products = [
  // Category: Burgers
  Product(
    id: 'p1',
    title: 'Classic Beef Burger',
    description: 'A juicy beef patty with lettuce, tomato, and cheese.',
    category: 'Burgers',
    price: 8.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p2',
    title: 'Chicken Burger',
    description: 'Grilled chicken breast with avocado and spicy mayo.',
    category: 'Burgers',
    price: 7.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p3',
    title: 'Veggie Burger',
    description: 'A healthy veggie patty with hummus and cucumber slices.',
    category: 'Burgers',
    price: 7.49,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p4',
    title: 'Cheese Burger',
    description: 'A classic burger with double cheddar cheese and pickles.',
    category: 'Burgers',
    price: 9.49,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p5',
    title: 'Bacon Burger',
    description: 'A delicious bacon cheeseburger with smoky BBQ sauce.',
    category: 'Burgers',
    price: 10.99,
    imageUrl: 'assets/product/chips.jpg',
  ),

  // Category: Pizza
  Product(
    id: 'p6',
    title: 'Margherita Pizza',
    description:
        'Classic pizza with fresh mozzarella, basil, and tomato sauce.',
    category: 'Pizza',
    price: 12.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p7',
    title: 'Pepperoni Pizza',
    description: 'Loaded with pepperoni and melted mozzarella cheese.',
    category: 'Pizza',
    price: 14.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p8',
    title: 'BBQ Chicken Pizza',
    description: 'Pizza topped with BBQ chicken, red onions, and cilantro.',
    category: 'Pizza',
    price: 15.49,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p9',
    title: 'Hawaiian Pizza',
    description: 'A tropical combination of ham, pineapple, and mozzarella.',
    category: 'Pizza',
    price: 13.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p10',
    title: 'Veggie Pizza',
    description: 'A colorful mix of bell peppers, olives, and mushrooms.',
    category: 'Pizza',
    price: 13.49,
    imageUrl: 'assets/product/chips.jpg',
  ),

  // Category: Salads
  Product(
    id: 'p11',
    title: 'Caesar Salad',
    description: 'Classic Caesar salad with romaine lettuce and croutons.',
    category: 'Salads',
    price: 9.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p12',
    title: 'Greek Salad',
    description:
        'Fresh salad with cucumbers, olives, feta cheese, and tomatoes.',
    category: 'Salads',
    price: 8.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p13',
    title: 'Cobb Salad',
    description: 'Salad with avocado, chicken, eggs, and blue cheese.',
    category: 'Salads',
    price: 10.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p14',
    title: 'Caprese Salad',
    description: 'Tomatoes, fresh mozzarella, and basil with balsamic glaze.',
    category: 'Salads',
    price: 9.49,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p15',
    title: 'Kale Salad',
    description:
        'Healthy kale salad with almonds, cranberries, and goat cheese.',
    category: 'Salads',
    price: 10.49,
    imageUrl: 'assets/product/chips.jpg',
  ),

  // Category: Desserts
  Product(
    id: 'p16',
    title: 'Chocolate Cake',
    description: 'Rich and moist chocolate cake with a creamy frosting.',
    category: 'Desserts',
    price: 6.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p17',
    title: 'Cheesecake',
    description: 'Classic New York cheesecake with a graham cracker crust.',
    category: 'Desserts',
    price: 7.49,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p18',
    title: 'Tiramisu',
    description: 'Italian dessert made with espresso, mascarpone, and cocoa.',
    category: 'Desserts',
    price: 7.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p19',
    title: 'Ice Cream Sundae',
    description:
        'Vanilla ice cream with chocolate syrup, whipped cream, and a cherry.',
    category: 'Desserts',
    price: 5.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p20',
    title: 'Apple Pie',
    description:
        'Warm apple pie with a flaky crust and cinnamon-spiced apples.',
    category: 'Desserts',
    price: 6.49,
    imageUrl: 'assets/product/chips.jpg',
  ),

  // Category: Drinks
  Product(
    id: 'p21',
    title: 'Coca-Cola',
    description: 'Classic Coca-Cola served chilled.',
    category: 'Drinks',
    price: 1.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p22',
    title: 'Lemonade',
    description: 'Refreshing lemonade with freshly squeezed lemons.',
    category: 'Drinks',
    price: 2.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p23',
    title: 'Orange Juice',
    description: 'Freshly squeezed orange juice with no added sugar.',
    category: 'Drinks',
    price: 3.49,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p24',
    title: 'Iced Coffee',
    description: 'Cold brew coffee with a splash of milk.',
    category: 'Drinks',
    price: 3.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
  Product(
    id: 'p25',
    title: 'Smoothie',
    description: 'A healthy blend of fruits and yogurt.',
    category: 'Drinks',
    price: 4.99,
    imageUrl: 'assets/product/chips.jpg',
  ),
];
