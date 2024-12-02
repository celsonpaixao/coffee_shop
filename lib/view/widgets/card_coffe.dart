import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/model/cofee_model.dart';
import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:flutter/material.dart';

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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Container for background color and shadow
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  color:
                      secundary, // Certifique-se de que a cor 'secundary' está definida
                ),
              ),
            ),
            // Container for the image
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: coffe.imageUrl!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 230,
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
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
            // Name text at the bottom
            Positioned(
              bottom: 45,
              left: 10,
              right: 10,
              child: AppGlobalText(
                text: coffe.name!,
                style: TextStyleEnum.p_bold,
                color: primary,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: AppGlobalText(
                text: coffe.price.toString(),
                style: TextStyleEnum.p_medium,
                color: dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
