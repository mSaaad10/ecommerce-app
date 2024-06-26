import 'package:ecommerce_app_c10_frida/di/di.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/brand_item_widget.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/category_item_widget.dart';
import 'package:ecommerce_app_c10_frida/presentation/ui/home/tabs/home_tab/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabView extends StatefulWidget {
  @override
  State<HomeTabView> createState() => _HomeTabViewState();
}

class _HomeTabViewState extends State<HomeTabView> {
  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Expanded(child: Text(state.errorMessage ?? '')),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                ),
              );
            }
          case SuccessState():
            {
              var categories = state.categories;
              var brands = state.brands;
              return Column(
                children: [
                  GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) =>
                        CategoryItemWidget(category: categories![index]),
                    itemCount: categories?.length,
                  ),
                  GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) =>
                        BrandItemWidget(brand: brands![index]),
                    itemCount: brands?.length,
                  ),
                ],
              );
            }
        }
      },
    );
    // return BlocConsumer<HomeTabViewModel, HomeTabState>(
    //   bloc: viewModel,
    //   buildWhen: (previous, current) {
    //     if(current is SuccessState) return true;
    //     return false;
    //   },
    //   listenWhen: (previous, current) {
    //     if(current is LoadingState) {
    //       return true;
    //     }
    //     if(current is ErrorState){
    //       return true;
    //     }
    //     return false;
    //   },
    //   listener: (context, state) {
    //     if(state is LoadingState){
    //       // show Loading dialog
    //     }
    //     if(state is ErrorState){
    //       // show error dialog with error message
    //     }
    //   },
    //   builder: (context, state){
    //     if(state is SuccessState){
    //       // rebuild ur widget
    //       return Scaffold();
    //     }
    // }
    // );
  }
}
