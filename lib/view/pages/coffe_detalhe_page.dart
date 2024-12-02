import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:coffee_shop/viewmodel/coffe_detalhe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
            return const Center(child: CircularProgressIndicator(color: primary,));
          }

          if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          }

          if (viewModel.coffe != null) {
            return Scaffold(
              backgroundColor: Colors.white,
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
        decoration: const BoxDecoration(
          color: secundary,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppGlobalText(
                  text: viewModel.coffe!.name!,
                  style: TextStyleEnum.h2_bold,
                ),
                AppGlobalText(
                  text: viewModel.coffe!.description!,
                  style: TextStyleEnum.p_medium,
                ),
                AppGlobalText(
                  text: viewModel.coffe!.price!.toString(),
                  style: TextStyleEnum.h2_bold,
                ),
                AppGlobalText(
                  text: viewModel.coffe!.region!,
                  style: TextStyleEnum.p_bold,
                ),

                // Gerando os perfis de sabor
                ...List.generate(
                  viewModel.coffe!.flavorProfile!.length,
                  (index) => AppGlobalText(
                    text: viewModel.coffe!.flavorProfile![
                        index], // Usando o valor de flavorProfile
                    style: TextStyleEnum.caption,
                  ),
                ),
                 ...List.generate(
                  viewModel.coffe!.grindOption!.length,
                  (index) => AppGlobalText(
                    text: viewModel.coffe!.grindOption![
                        index], // Usando o valor de flavorProfile
                    style: TextStyleEnum.caption,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Positioned _builImage(CoffeDetalheViewModel viewModel) {
    return Positioned(
      left: 0,
      right: 0,
      top: 30,
      child: SizedBox(
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: viewModel.coffe!.imageUrl!,
          imageBuilder: (context, imageProvider) => Container(
            height: 400,
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
    );
  }
}
