import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ImageProvider image;
  final String description;
  final String productname;
  final String price;
  final double rating;

  const ProductCard({
    required this.image,
    required this.description,
    required this.productname,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 245,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: image,
                  height: 136,
                  width: 164,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20 , width: 148, child:     Text(
                productname,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 20
                ),
              ), ), // Adjusted height

              SizedBox(height: 32 , width: 148,child:  Text(
                description,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 16
                ),
              ), ), // Adjusted height
              SizedBox(height: 15 , width: 66,child:    Text(
                price,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 16
                ),
              ), ), // Adjusted height

              Spacer(), // Added Spacer to push the rating to the bottom
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 5 , height: 14, child: Text(
                    rating.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ), ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
