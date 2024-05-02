import 'package:flutter/material.dart';
import 'package:stylish/const.dart';
import 'package:stylish/core/extension/context_extension.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shopping List",
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: context.width,
            height: 191,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        kWomen,
                        width: 130,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Women’s Casual Wear",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Variations : ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 39,
                                height: 17,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(color: Colors.black)),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Black",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 39,
                                height: 17,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(color: Colors.black)),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Red",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "4.8",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                  width: 80,
                                  height: 10,
                                  child: ListView.builder(
                                      itemCount: 5,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 14.5,
                                          ))),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 84,
                                height: 29,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: const Color(0xFFCACACA))),
                                alignment: Alignment.center,
                                child: const Text(
                                  "\$ 34.00",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'upto 33% off',
                                    style: TextStyle(
                                        color: Color(0xFFEB3030),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  Text(
                                    '\$ 64.00',
                                    style: TextStyle(
                                        color: Color(0xFFA7A7A7),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                  thickness: 1.0,
                  color: Color(0xFFBBBBBB),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Order (${1})   :",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                    Text(
                      "\$ 34.00",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
