import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:coffee_shop/view/widgets/card_coffe.dart';
import 'package:coffee_shop/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final viewModel = Provider.of<HomeViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.coffes.isEmpty) {
        viewModel.initialize();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(viewModel),
    );
  }

  Container _buildBody(HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: primary,
            ))
          : viewModel.errorMessage != null
              ? Center(child: Text(viewModel.errorMessage!))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        2, // Ajuste o número de colunas conforme necessário
                    childAspectRatio:
                        0.7, // Ajuste o aspecto de cada item (opcional)
                  ),
                  //    scrollDirection: Axis.horizontal,
                  itemCount: viewModel.coffes.length,
                  itemBuilder: (context, index) {
                    var coffe = viewModel.coffes[index];
                    return CardCoffe(
                      coffe: coffe,
                      onclick: () {
                        viewModel.navigateToDetalhePage(coffe.id!);
                      },
                    );
                  },
                ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: AppGlobalText(
        text: 'Coffee Shop',
        style: TextStyleEnum.h2_bold,
        color: ligth,
      ),
      backgroundColor: primary,
    );
  }
}
