import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/model/cofee_model.dart';
import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_spacing.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardCoffe extends StatelessWidget {
  final CoffeModel coffe;
  final Function() onclick;

  const CardCoffe({super.key, required this.coffe, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: secundary)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 22.h,
                decoration: BoxDecoration(
                  color: secundary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CachedNetworkImage(
                  imageUrl: coffe.imageUrl!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 22.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: primary,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const AppGlobalVericalSpacing(
                value: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      child: AppGlobalText(
                        text: coffe.name!,
                        style: TextStyleEnum.p_medium,
                      ),
                    ),
                    AppGlobalText(
                      text: "\$ ${coffe.price.toString()}",
                      style: TextStyleEnum.p_bold,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
