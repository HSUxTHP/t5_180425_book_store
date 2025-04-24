import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book_model.dart';
import '../providers/cart_provider.dart';

class ProductCart extends StatefulWidget {
  ProductCart({super.key, required this.book});

  final Book book;


  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.book.imageUrl[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.book.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '\$${widget.book.price}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.book.description,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            //dateSell is later than now
            if (widget.book.dateSell != null &&
                widget.book.dateSell!.isAfter(DateTime.now()))
              Text(
                'Available until: ${widget.book.dateSell!.toLocal().toString().split(' ')[0]}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    print("Detail: ${widget.book.name}");
                    Navigator.pushNamed(context, '/detail', arguments: widget.book);
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  label: const Text('Detail'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    BookInCart newBook = BookInCart(
                      id: widget.book.id,
                      name: widget.book.name,
                      price: widget.book.price,
                      imageUrl: widget.book.imageUrl,
                      description: widget.book.description,
                      size: widget.book.size,
                      inStock: widget.book.inStock,
                      maxBuy: widget.book.maxBuy,
                      dateSell: widget.book.dateSell,
                      data: widget.book.data,
                      dataNum: widget.book.dataNum,
                    );

                    final cartProvider = Provider.of<CartProvider>(context, listen: false);
                    int existingQty = cartProvider.cartItems
                        .where((item) => item.id == newBook.id)
                        .fold(0, (sum, item) => sum + item.quantity);

                    // kiểm tra trước khi thêm
                    if (existingQty >= newBook.maxBuy) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Exceeded purchase limit for this product.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    if (existingQty >= newBook.inStock) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Not enough stock'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    print("Add to cart: ${newBook.name}");
                    cartProvider.addToCart(context, newBook);

                    if (widget.book.dateSell!.isBefore(DateTime.now())) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${widget.book.name} has been added to cart!'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  onHover: (isHovering) {
                    setState(() {
                      isHovering = isHovering;
                    });
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: const Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
