import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swaan_app/presentation/bloc/bloc/home_bloc_state.dart';
import 'package:swaan_app/resources/asset_manager.dart';


import '../../data/model/fetch_data_model.dart';
import '../bloc/bloc/home_bloc_bloc.dart';

import '../bloc/bloc/home_bloc_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              _svgBuilder(AssetManager.logo),
              Spacer(),
              _svgBuilder(AssetManager.searchICon),
              _svgBuilder(AssetManager.favouriteIcon),
              _svgBuilder(AssetManager.cartIcon),


            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeInitial) {
                BlocProvider.of<HomeBloc>(context).add(FetchData());
                return  const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeLoaded) {
                final data = state.data;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.banners.isNotEmpty)
                        CarouselSlider(
                          items: data.banners.map((banner) {
                            return Image.network(banner.image);
                          }).toList(),
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlay: true,
                            enlargeCenterPage: true,
                          ),
                        ),
                      SizedBox(height: 20),

                      if (data.recentViews.isNotEmpty)
                        _buildProductList("Our Products", data.recentViews),
                      const SizedBox(height: 20),
                      if (data.suggestedProducts.isNotEmpty)
                      _buid_suggested_products("Suggested for you", data.suggestedProducts),
                      SizedBox(height: 20),

                      if (data.suggestedProducts.isNotEmpty)
                        _buid_new_arrivals("New Arrivals", data.suggestedProducts),
                      SizedBox(height: 20),




                    ],
                  ),
                );
              } else if (state is HomeError) {
                return Center(
                  child: Text('Error: ${state.error}'),
                );
              } else {
                return Center(
                  child: Text('Unknown state'),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductList(String heading, List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            heading,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(product.image),
                ),
              );
            },
          ),
        ),
      ],
    );

  }

  Widget _buid_suggested_products(String heading, List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            heading,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                      children: [
                        Image.network(product.image,height: 150,),
                        Text(product.name??""),
                        Text("OMR ${product.price}"??""),
                      ],
                    ),
                  )
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buid_new_arrivals(String heading, List<Product> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            heading,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 200,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                      children: [
                        Image.network(
                          product.image,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          product.name ?? "",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          product.price ?? "",
                          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 0.7,
            ),
          ),

        ),
      ],
    );
  }


  Widget _svgBuilder(String image){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(image,fit: BoxFit.cover,),
    );
  }
}
