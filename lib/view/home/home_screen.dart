import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../component/main_header.dart';
import '../../controller/controller.dart';
import 'component/carousel_slider/carousel_loading.dart';
import 'component/carousel_slider/carousel_slider_view.dart';
import 'component/popular_category/popular_category.dart';
import 'component/popular_category/popular_category_loading.dart';
import 'component/popular_product/popular_product.dart';
import 'component/popular_product/popular_product_loading.dart';
import 'component/section_title.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            const MainHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Obx(() {
                      if (homeController.bannerList.isNotEmpty) {
                        return CarouselSliderView(
                            bannerList: homeController.bannerList);
                      } else {
                        return const CarouselLoading();
                      }
                    }),
                    const SectionTitle(title: "Popular Category"),
                    Obx(() {
                      if (homeController.popularCategoryList.isNotEmpty) {
                        return PopularCategory(
                            categories: homeController.popularCategoryList);
                      } else {
                        return const PopularCategoryLoading();
                      }
                    }),
                    const SectionTitle(title: "Popular Product"),
                    Obx(() {
                      if (homeController.popularProductList.isNotEmpty) {
                        return PopularProduct(
                            popularProducts: homeController.popularProductList);
                      } else {
                        return const PopularProductLoading();
                      }
                    }),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}