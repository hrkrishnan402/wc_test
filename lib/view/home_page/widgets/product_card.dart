import 'package:flutter/material.dart';
import 'package:wb_test/model/product_model.dart';

class ProductListCard extends StatelessWidget {
  final ProductContent productContent;

  const ProductListCard({super.key, required this.productContent});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 220,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(productContent.productImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (!(productContent.actualPrice == productContent.offerPrice))
                Container(
                  height: 30,
                  width: 20,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.orange,
                  ),
                  child: Text(
                    'Sales ${productContent.discount}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  productContent.productName,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    productContent.productRating > i
                        ? const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 12,
                          )
                        : const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                          ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '\$${productContent.actualPrice}',
                    style: TextStyle(
                        decoration: !(productContent.actualPrice ==
                                productContent.offerPrice)
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                  const SizedBox(width: 8),
                  if (!(productContent.actualPrice ==
                      productContent.offerPrice))
                    Text(
                      '\$${productContent.offerPrice}',
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
