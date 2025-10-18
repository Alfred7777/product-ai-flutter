import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_ai_flutter/repositories/product_repository.dart';
import 'package:product_ai_flutter/resources/app_strings.dart';
import 'package:product_ai_flutter/resources/app_colors.dart';
import 'package:product_ai_flutter/widgets/order_tab.dart';
import 'package:product_ai_flutter/widgets/products_tab.dart';
import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final ProductRepository productRepository = ProductRepository();
  late HomeBloc _homeBloc;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(
      productRepository,
    );

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2, 
        child: Scaffold(
          appBar: TabBar(
            controller: _tabController,
            indicatorColor: AppColors.kMainAccentColor,
            labelColor: AppColors.kMainAccentColor,
            unselectedLabelColor: AppColors.kPrimaryColor,
            tabs: const [
              Tab(
                text: AppStrings.kProductsTabName,
              ),
              Tab(
                text: AppStrings.kOrderTabName,
              ),
            ]
          ),
          backgroundColor: AppColors.kMainBackgroundColor,
          body: BlocConsumer(
            bloc: _homeBloc,
            listener: (context, state) {
              if (state is HomeError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: AppColors.kSecondAccentColor,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is HomeUninitialized) {
                _homeBloc.add(FetchProducts());
              }
              if (state is HomeReady) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    ProductsTab(
                      productList: state.productList,
                    ),
                    OrderTab(),
                  ],
                );
              } 
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.kMainAccentColor,
                ),
              );
            },
          )
        ),
      ),
    );
  }
}