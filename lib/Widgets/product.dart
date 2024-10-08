import 'package:chips_collection/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double? titleFontSize;
  final VoidCallback? onAddToCart;
  final double? paddingH;
  final double? paddingV;
  final double? paddingIcon;
  final double? paddingIconH;
  final double? paddingIconV;
  final double? borderRadius;
  final VoidCallback onTap;
  final double? titleWidth;

  const ProductCard({
    super.key,
    required this.product,
    this.titleFontSize,
    this.paddingH,
    this.paddingV,
    this.paddingIcon,
    this.paddingIconH,
    this.paddingIconV,
    this.borderRadius,
    this.titleWidth,
    required this.onAddToCart,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 24.0),
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
              left: 10,
              right: 10,
              child: SizedBox(
                width: titleWidth,
                child: Positioned(
                  child: Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: titleFontSize ?? 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Category container below the title
            Positioned(
              top: 56,
              // left: 16,
              // right: 16,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
                padding: EdgeInsets.symmetric(
                  horizontal: paddingH ?? 4.0,
                  vertical: paddingV ?? 4.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onAddToCart,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: paddingIconH ?? 16.0,
                          vertical: paddingIconV ?? 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: const Icon(
                          Icons.add_shopping_cart,
                          size: 12,
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
      ),
    );
  }
}
