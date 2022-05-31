import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget {
  late bool centerTitle;
  late Widget myWidget;
  late Widget leadingWidget;
  late Widget titleWidget;
  late double expandedHeight;
  late bool searchIconShow;
  late bool showBackButton;
  late bool showBottom;
  CustomAppBar({
    Key? key,
    required this.centerTitle,
    required this.expandedHeight,
    required this.searchIconShow,
    required this.showBackButton,
    required this.myWidget,
    required this.leadingWidget,
    required this.titleWidget,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: widget.showBackButton,
                centerTitle: widget.centerTitle,
                iconTheme: const IconThemeData(color: Colors.black),
                leading:innerBoxIsScrolled?Container(): widget.leadingWidget,
                expandedHeight: widget.expandedHeight,
                titleSpacing: 0,
                floating: false,
                snap: false,
                pinned: true,
                actions: [
                  widget.searchIconShow
                      ? InkWell(
                    onTap: (){
                     
                     
                    },
                        child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                      )
                      : Container(),
                  widget.searchIconShow
                      ? const SizedBox(width: 20)
                      : Container(),
                  InkWell(
                    onTap: (){
                      },
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: (){
                      
                    },
                      child: const Icon(Icons.shopping_bag, color: Colors.black)),
                  const SizedBox(width: 20),
                ],
                flexibleSpace: widget.titleWidget),
          ];
        },
        body: widget.myWidget);
  }


}
