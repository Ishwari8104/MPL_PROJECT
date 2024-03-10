import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furnitureapp/model/category_model.dart';
import 'package:furnitureapp/screens/BuildGuidePage.dart';

class ProductScreen extends StatefulWidget {
  final CategoryModel model;

  ProductScreen(this.model);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List images = [], similarImages = [];
  List<int> colorList = [0xFF304B82, 0xFFBB4477, 0xFFF8C184, 0xFF5ABE65];
  int selectedColorIndex = 0, scrolledImageIndex = 0, selectedSimilarColorIndex = 0;

  Widget getColors(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColorIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        width: 31,
        height: 31,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedColorIndex == index ? Color(colorList[index]) : Colors.white,
            width: 1,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(31),
        ),
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: Color(colorList[index]),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Widget getSimilarColorImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSimilarColorIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.only(top: 2, bottom: 2, right: 20),
        width: 80,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE7EEF8),
              blurRadius: 1,
              offset: Offset(2.6, 2.6),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.5,
            color: selectedSimilarColorIndex == index ? Colors.indigo : Colors.transparent,
          ),
        ),
        child: Image.asset('assets/images/${similarImages[index]}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    images = widget.model.differentImageUrl.keys.toList();
    similarImages = widget.model.differentImageUrl[images[scrolledImageIndex]]!;
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              // Custom App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE7EEF8),
                            blurRadius: 4,
                            offset: Offset(0.6, 0.7),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(Icons.local_grocery_store),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                               context,
                                MaterialPageRoute(
                                  builder: (context) => BuildGuidePage(model: widget.model),
                                ),
                              );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE7EEF8),
                            blurRadius: 4,
                            offset: Offset(0.6, 0.7),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(Icons.book),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFE7EEF8),
                            blurRadius: 4,
                            offset: Offset(0.6, 0.7),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(Icons.keyboard_backspace),
                    ),
                  ),
                ],
              ),
              // Image Show
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(height: 28),
                    // Images and slide color
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 12,
                          child: Stack(
                            children: [
                              Container(
                                height: 220,
                                padding: EdgeInsets.symmetric(vertical: 30),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFFE7EEF8),
                                      blurRadius: 1,
                                      offset: Offset(4.6, 4.6),
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: PageView.builder(
                                  itemCount: images?.length ?? 0,
                                  controller: PageController(
                                    viewportFraction: 0.55,
                                  ),
                                  onPageChanged: (i) => setState(() {
                                    selectedSimilarColorIndex = 0;
                                    scrolledImageIndex = i;
                                  }),
                                  itemBuilder: (_, i) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      child: Image.asset("assets/images/${images[i]}.png"),
                                      height: 90,
                                      width: 90,
                                    );
                                  },
                                ),
                              ),
                              Positioned.directional(
                                end: 15,
                                top: 15,
                                textDirection: TextDirection.ltr,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFE3EFFE),
                                          blurRadius: 4,
                                          offset: Offset(3.6, 1.7),
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(Icons.favorite_border),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 220,
                            child: Container(
                              height: 220,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFFE7EEF8),
                                    blurRadius: 1,
                                    offset: Offset(2.6, 2.6),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(45),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 25),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: colorList
                                      .asMap()
                                      .entries
                                      .map((MapEntry map) => getColors(map.key))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Similar images
                    SizedBox(height: 28),
                    Container(
                      height: 100, // Adjusted height
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: similarImages
                            .asMap()
                            .entries
                            .map((MapEntry map) => getSimilarColorImage(map.key))
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Product Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Product Details
                        Expanded(
                          flex: 12,
                          child: Container(
                            height: 200,
                            padding: EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFE7EEF8),
                                  blurRadius: 4,
                                  offset: Offset(4.6, 4.6),
                                ),
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(90),
                                bottomLeft: Radius.circular(90),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.model.fullName,
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 7),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 30,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                                  onRatingUpdate: (rating) {},
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text(
                                  widget.model.price,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Build Guide Button
                        // Expanded(
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       // Navigate to Build Guide Page
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => BuildGuidePage(model: widget.model),
                        //         ),
                        //       );
                        //     },
                        //     child: Text("Build Guide"),
                        //   ),
                        // ),
                        Expanded(child: SizedBox()),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFE7EEF8),
                                  blurRadius: 1,
                                  offset: Offset(2.6, 2.6),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(65),
                                topRight: Radius.circular(65),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              widget.model.description,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
