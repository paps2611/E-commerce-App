import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/styles/shadow.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verification.dart';
import 'package:t_store/common/widgets/texts/price_tag.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../icons/circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          //THUMBNAIL
          Container(
            decoration: BoxDecoration(
              color: dark ? TColors.dark : TColors.light,
              borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              border: Border.all(
                color: dark ? TColors.dark : TColors.light,
              ),
            ),
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            child: Stack(
              children: [
                //THUMBNAIL IMAGE
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                //FAV ICON BUTTON
                Positioned(
                  top: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    decoration: BoxDecoration(
                      color: TColors.secondary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                    ),
                    child: Text(
                      '25%', // Replace with actual discount tag
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: TColors.black,
                          ),
                    ),
                  ),
                ),
                //WIshlist button
                const Positioned(
                  top: -12,
                  right: -6,
                  child: HeartIcon(
                    borderColor: TColors.white,
                    insideColor: Colors.red,
                    size: 24,
                    icon: Icons.favorite,
                  ),
                ),
              ],
            ),
          ),

          //DETAILS
          SizedBox(
            width: 150,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Green Nike Sport Shoes',
                        smallSize: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerification(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //PRICING
                      Flexible(child: const TproductPriceTag(price: '750')),

                      //ADD TO CART
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    TSizes.productImageRadius))),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
