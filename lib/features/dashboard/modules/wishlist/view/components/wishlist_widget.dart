import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/features/dashboard/modules/wishlist/view/components/product_card.dart';
import '../../../../../../const.dart';
import '../../../../../../core/utils/core.dart';
import '../../../../../auth/registration/model/textfield_model.dart';
import '../../../../../auth/registration/view/component/textfield_widget.dart';


class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            child: TextFieldWidget(
              model: TextFieldModel(
                textStyle: Core.instance.authTextStyle,
                inputDecoration: Core.instance.authInputDecoration(context).copyWith(
                  prefixIcon: const Icon(CupertinoIcons.search),
                  hintText: "Search any Product..",
                  hintStyle: const TextStyle(
                    color: Color(0xFFBBBBBB),
                    fontSize: 14.5,
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: const Icon(CupertinoIcons.mic),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "52,082+ Items",
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                width: 70,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "Sort",
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_upward_rounded,
                      size: 14,
                    ),
                    const Icon(
                      Icons.arrow_downward_rounded,
                      size: 14,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              Container(
                width: 70,
                height: 30,
                margin: const EdgeInsets.only(right: 4),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  children: [
                    Text(
                      "Filter",
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.filter_alt_outlined,
                      size: 17,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Example card
          Container(height: context.height,child:GridView.builder(itemCount: 6 ,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder:(context,index)=>ProductCard(
            image: AssetImage(kHodiees),
            productname: 'Black Winter...',
            description: 'Autumn And Winter Casual cotton-padded jacket...',
            price: '₹499',
            rating: 4.5,
          )  ,)
          )
          ,
          // Add more ProductCards as needed
        ],
      ),
    );
  }
}