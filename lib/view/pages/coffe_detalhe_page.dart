import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_spacing.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:coffee_shop/viewmodel/coffe_detalhe_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoffeDetalhePage extends StatefulWidget {
  final int id;
  const CoffeDetalhePage({super.key, required this.id});

  @override
  State<CoffeDetalhePage> createState() => _CoffeDetalhePageState();
}

class _CoffeDetalhePageState extends State<CoffeDetalhePage> {
  @override
  void initState() {
    super.initState();
    final viewModel =
        Provider.of<CoffeDetalheViewModel>(context, listen: false);
    // Carregar os dados assim que a página for carregada
    viewModel.findCoffe(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<CoffeDetalheViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: primary,
            ));
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          }

          if (viewModel.coffe != null) {
            return Scaffold(
              backgroundColor: secundary,
              body: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Stack(
                  children: [
                    _builBody(context, viewModel),
                    _builImage(viewModel)
                  ],
                ),
              ),
            );
          }

          // Mensagem de erro caso o café não seja encontrado
          return const Center(child: Text('Coffe not found'));
        },
      ),
    );
  }

  Positioned _builBody(BuildContext context, CoffeDetalheViewModel viewModel) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * .6,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: dark.withOpacity(.2),
                offset: const Offset(0, -1),
                blurRadius: 10)
          ],
          borderRadius: const BorderRadiusDirectional.vertical(
            top: Radius.circular(30),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 15.w,
                  height: 5,
                  decoration: BoxDecoration(
                      color: ligth, borderRadius: BorderRadius.circular(2)),
                ),
                const AppGlobalVericalSpacing(),
                SizedBox(
                  height: 50.h,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppGlobalText(
                          text: viewModel.coffe!.name!,
                          style: TextStyleEnum.h2_bold,
                        ),
                        const AppGlobalVericalSpacing(
                          value: 5,
                        ),
                        AppGlobalText(
                          text: viewModel.coffe!.description!,
                          style: TextStyleEnum.p_normal,
                          color: dark.withOpacity(.7),
                        ),
                        const AppGlobalVericalSpacing(value: 10),
                        Row(
                          children: List.generate(5, (index) {
                            var item = viewModel.coffe!.roast_level!;
                            return Icon(
                              Icons.star,
                              color: index < item ? Colors.amber : ligth,
                            );
                          }),
                        ),
                        const Divider(
                          height: 40,
                        ),
                        Row(
                          children: [
                            AppGlobalText(
                              text: "Price:",
                              color: dark.withOpacity(.8),
                              style: TextStyleEnum.p_medium,
                            ),
                            const AppGlobalHorizontalSpacing(),
                            AppGlobalText(
                              text: viewModel.coffe!.price!.toString(),
                              color: dark.withOpacity(.9),
                              style: TextStyleEnum.h2_bold,
                            ),
                          ],
                        ),
                        const AppGlobalVericalSpacing(),
                        Row(
                          children: [
                            AppGlobalText(
                              text: "Region:",
                              color: dark.withOpacity(.8),
                              style: TextStyleEnum.p_medium,
                            ),
                            const AppGlobalHorizontalSpacing(),
                            AppGlobalText(
                              text: viewModel.coffe!.region!,
                              color: dark.withOpacity(.9),
                              style: TextStyleEnum.p_bold,
                            ),
                          ],
                        ),
                        const AppGlobalVericalSpacing(
                          value: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppGlobalText(
                              text: "Flavor Profile",
                              style: TextStyleEnum.h3_bold,
                            ),
                            const AppGlobalVericalSpacing(),
                            _buildFlavorProfile(viewModel),
                          ],
                        ),
                        const AppGlobalVericalSpacing(
                          value: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppGlobalText(
                              text: "Grind Option",
                              style: TextStyleEnum.h3_bold,
                            ),
                            _buildGrindOption(viewModel),
                          ],
                        ),
                         const AppGlobalVericalSpacing(
                          value: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildGrindOption(CoffeDetalheViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(viewModel.coffe!.grindOption!.length, (index) {
        var item = viewModel.coffe!.grindOption![index];
        return Padding(
          padding: const EdgeInsets.only(left: 0, top: 5),
          child: AppGlobalText(
            text: "... $item",
            style: TextStyleEnum.p_medium,
            color: primary,
          ),
        );
      }),
    );
  }

  Widget _buildFlavorProfile(CoffeDetalheViewModel viewModel) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: viewModel.coffe!.flavorProfile!.map((flavor) {
        return Chip(
          label: AppGlobalText(
            text: flavor,
            style: TextStyleEnum.p_normal,
            color: Colors.white,
          ),
          backgroundColor: primary.withOpacity(.9),
          shape: const StadiumBorder(
            side: BorderSide(color: primary, width: 0),
          ),
        );
      }).toList(),
    );
  }

  Positioned _builImage(CoffeDetalheViewModel viewModel) {
    return Positioned(
      left: 0,
      right: 0,
      top: 30,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: viewModel.coffe!.imageUrl!,
              imageBuilder: (context, imageProvider) => Container(
                height: 40.h,
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
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              onPressed: () => viewModel.backToHome(),
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(.7)),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
        ],
      ),
    );
  }
}
