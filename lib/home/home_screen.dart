import 'dart:async';
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
  late TextEditingController _textFilterController;
  late TextEditingController _orderPromptController;

  // ignore: unused_field
  late Timer _debounce;
  final int _debouncetime = 500;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(productRepository);

    _tabController = TabController(length: 2, vsync: this);

    _textFilterController = TextEditingController();
    _textFilterController.addListener(_onQueryChanged);

    _orderPromptController = TextEditingController();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  void _analyzeOrder() {
    _homeBloc.add(
      AnalyzeOrder(
        _orderPromptController.text,
      ),
    );
  }

  void _fetchProducts() {
    _homeBloc.add(
      FetchProducts(
        _textFilterController.text.length >= 2 ? _textFilterController.text : '',
      ),
    );
  }

  void _onQueryChanged() {
    _debounce = Timer(Duration(milliseconds: _debouncetime), () {
      if (_homeBloc.state is HomeReady) {
        _fetchProducts();
      }
    });
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
            buildWhen: (prevState, currState) {
              if (currState is HomeError) {
                return false;
              }
              if (prevState is HomeReady || currState is HomeLoading) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              if (state is HomeUninitialized) {
                _fetchProducts();
              }
              if (state is HomeReady) {
                return TabBarView(
                  controller: _tabController,
                  children: [
                    ProductsTab(
                      queryTextController: _textFilterController,
                      productList: state.productList,
                    ),
                    OrderTab(
                      promptTextController: _orderPromptController,
                      orderList: state.orderList,
                      analyzeOrderCallback: _analyzeOrder,
                    ),
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