import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/hot_deals.dart';
import 'item_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final productBloc = context.read<HomeBloc>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(GetBanners());
    });
    return Container(child: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
        } else if (state is HomeLoaded) {
          List<Map<String, dynamic>> items =
              state.products[15]['items'].cast<Map<String, dynamic>>();
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              imageCarousel(context, state.banners),
              const SizedBox(height: 10),
              mainShortCuts(context, state.mainShortCuts),
              const SizedBox(height: 10),
              HotDeals(
                  count: state.products[15]['items'].length,
                  items: items,
                  title: state.products[15]['title'],
                  subTitle: state.products[15]['subtitle'],
                  size: size.height * 1.5,
                   cardHeight: size.height * 0.38),
              SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[16]['items'].length,
                  items:
                      state.products[16]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[16]['title'],
                  subTitle: state.products[16]['subtitle'],
                  size: size.height * 0.93,
                   cardHeight: size.height * 0.45,
              ),
                  SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[17]['items'].length,
                  items:
                      state.products[17]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[17]['title'],
                  subTitle: state.products[17]['subtitle'],
                  size: size.height * 1.58,
                   cardHeight: size.height * 0.38),
                  SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[21]['items'].length,
                  items:
                      state.products[21]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[21]['title'],
                  subTitle: state.products[18]['subtitle'],
                  size: size.height * 1.2,
                  
                  cardHeight: size.height * 0.38),
                    SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[27]['items'].length,
                  items:
                      state.products[27]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[27]['title'],
                  subTitle: state.products[27]['subtitle'],
                  size: size.height * 0.82,
                   cardHeight: size.height * 0.38),
                    SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[28]['items'].length,
                  items:
                      state.products[28]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[28]['title'],
                  subTitle: state.products[28]['subtitle'],
                  size: size.height * 0.82,
                  cardHeight: size.height * 0.38),
                    SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[29]['items'].length,
                  items:
                      state.products[29]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[29]['title'],
                  subTitle: state.products[29]['subtitle'],
                  size: size.height * 1.15,
                   cardHeight: size.height * 0.38),
                    SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[30]['items'].length,
                  items:
                      state.products[30]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[30]['title'],
                  subTitle: state.products[30]['subtitle'],
                  size: size.height * 0.8,
                   cardHeight: size.height * 0.38),
                    SizedBox(height: size.height * 0.1),
              HotDeals(
                  count: state.products[33]['items'].length,
                  items:
                      state.products[33]['items'].cast<Map<String, dynamic>>(),
                  title: state.products[33]['title'],
                  subTitle: state.products[33]['subtitle'],
                  size: size.height * 0.78,
                   cardHeight: size.height * 0.38),
                      
            ],
          );
        } else if (state is HomeError) {
          return Text(state.message);
        }
        return Container();
      },
    ));
  }

  Widget imageCarousel(
      BuildContext context, List<Map<String, dynamic>> imageList) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
          itemCount: imageList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Image.network(imageList[index]['mobileImageUrl']);
          },
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          )),
    );
  }

  Widget mainShortCuts(BuildContext context, List<Map<String, dynamic>> list) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ClipOval(
                  child: Image.network(list[index]['imageUrl'],
                      width: 50, height: 50, fit: BoxFit.contain),
                ),
                Text(list[index]['title']),
              ],
            );
          }),
    );
  }

  Widget buildProductsHome(
      BuildContext context, List<Map<String, dynamic>> list) {
    return Container();
  }
}
