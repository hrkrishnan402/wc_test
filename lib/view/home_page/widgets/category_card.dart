import 'package:flutter/material.dart';
import 'package:wb_test/model/category_model.dart';

class CategoryListCard extends StatelessWidget {
  final CategoryContent categoryContent;

  CategoryListCard({required this.categoryContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 64,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(categoryContent.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                categoryContent.title,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
