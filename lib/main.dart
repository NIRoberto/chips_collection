import 'package:chips_collection/Routes/route.dart';
import 'package:chips_collection/Screens/products.dart';
import 'package:chips_collection/Screens/checkout.dart';
import 'package:chips_collection/Screens/home.dart';
import 'package:chips_collection/Screens/product_datails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  },
  routes: [
    GoRoute(
        name: RoutesNames.home,
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        }),
    GoRoute(
        name: RoutesNames.cart,
        path: '/cart',
        builder: (context, state) {
          return const ProductsScreen();
        }),
    GoRoute(
      name: RoutesNames.product,
      path: '/product/:id',
      builder: (context, state) {
        return ProductDetailsScreen(id: state.pathParameters['id']);
      },
    ),
    GoRoute(
      name: RoutesNames.checkout,
      path: '/checkout',
      builder: (context, state) {
        return const CheckoutScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          primary: Color(0xffeec643),
          secondary: Color(0xffeec643),
          surface: Color(0XFFeef0f2),
          background: Color(0XFFeef0f2),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF141414),
          onBackground: Color(0xFF141414),
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      title: 'Chips Collection',
      routerConfig: _router,
    );
  }
}
