import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'widgets/custom_appbar.dart';
import 'utils/dummy_model.dart';
import 'utils/my_theme.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var top = 0.0;

  int _current = 0;
  final CarouselController _cController = CarouselController();

  

  FocusNode searchNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomAppBar(
              centerTitle: true,
              expandedHeight: 120,
              searchIconShow: false,
              showBackButton: true,
              myWidget: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 130,
                        child: ListView.builder(
                            itemCount: category.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, i) {
                              return _buildCategoryItems(i);
                            }),
                      ),
                    ),
                    _buildSlider(),
                    const SizedBox(height: 20),
                    _buildAdvertisement(),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("IN THE SPOTLIGHT",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 20),
                    _buildSpotLight(),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("Trending Stores & Guides",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 10),
                    _buildTrendingStores(),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("FEATURED BRANDS",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 10),
                    _buildFeatured(),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text("EDITOR'S CHOICE",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 10),
                  
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              leadingWidget: top < 100
                  ? const SizedBox(width: 0, height: 0)
                  :const Padding(
                      padding:  EdgeInsets.only(left: 8.0),
                      child: Center(child: Text("Logo",style:TextStyle(color:Colors.black))),
                    ),
              titleWidget:
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: EdgeInsets.zero,
                    title: Padding(
                        padding: top < 70
                            ? const EdgeInsets.fromLTRB(0, 5, 80, 8)
                            : const EdgeInsets.all(10),
                        child: SizedBox(
                          height: top < 70 ? 40 : 30,
                          width: top < 70 ? 250 : 200,
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(5.0),
                            child: TextFormField(
                              focusNode: searchNode,
                              onTap: () {
                               
                                searchNode.unfocus();
                              },
                              cursorColor: Colors.grey,
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: const Icon(Icons.search,
                                    size: 18, color: Colors.grey),
                                labelText: "Search",
                                filled: true,
                                fillColor: Colors.grey[300],
                                labelStyle: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )));
              }))),
    );

 }

  _buildCategoryItems(int i) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset('assets/images/background.jpg',
              height: 84, width: 80, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text(category[i]),
          )
        ]),
      ),
    );
  }

  _buildSlider() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                CarouselSlider(
                  items: sliderImages.map((image) {
                    return FadeInImage.assetNetwork(
                      placeholder: "assets/images/logo.png",
                      image: image,
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() => _current = index);
                    },
                    height: MediaQuery.of(context).size.height * .48,
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: sliderImages.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _cController.animateToPage(entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : MyTheme.themeColor)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }

  _buildAdvertisement() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Material(
        elevation: 5,
        child: Image.network(
          advertisementBanner.first,
          height: MediaQuery.of(context).size.height * 0.3,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _buildSpotLight() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: spotLights.length,
        itemBuilder: (_, i) {
          return Column(
            children: [
              Material(
                  elevation: 3,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(spotLights[i]),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: double.infinity,
                            minHeight: 40,
                          ),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary: MyTheme.themeColor),
                              onPressed: () {},
                              child: const Text("15% off")),
                        ),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }

  _buildTrendingStores() {
    return CarouselSlider(
      options: CarouselOptions(
          enableInfiniteScroll: false,
          initialPage: 0,
          height: MediaQuery.of(context).size.height * 0.3,
          enlargeCenterPage: false,
          viewportFraction: 0.89),
      items: sliderImages.map((image) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Material(
            elevation: 3,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/logo.png",
              image: image,
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        );
      }).toList(),
    );
  }

  _buildFeatured() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: 
       StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: featuredProducts.length,
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        itemBuilder: (ctx, index) {
          return Card(
            child: SizedBox(
                height: 280,
                child: Column(children: [
                  Container(
                      alignment: Alignment.topCenter,
                      child: Image.asset(featuredProducts[index])),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 3),
                    child: Text("Complimentry Lip Glace",
                        style: TextStyle(
                            color: MyTheme.themeColor,
                            height: 1.5,
                            fontSize: 15)),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 10),
                    child: Text("On Rs 500: Best Seller Gift",
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.1,
                        )),
                  ),
                ])),
          );
        },
      ),
    );
  }

 
}
