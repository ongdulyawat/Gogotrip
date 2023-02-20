import 'package:flutter/material.dart';
import 'package:gogotrip/constants/styles.dart';

class RecommendCard extends StatefulWidget {
  const RecommendCard({Key? key}) : super(key: key);

  @override
  State<RecommendCard> createState() => _RecommendCardState();
}

class _RecommendCardState extends State<RecommendCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildListItem('Kasetsart', 'assets/images/beach.png', 'Bangken',
              '4.5', Colors.white),
          _buildListItem('Kasetsart', 'assets/images/beach.png', 'Bangken',
              '4.5', Colors.white),
          _buildListItem('Kasetsart', 'assets/images/beach.png', 'Bangken',
              '4.5', Colors.white)
        ],
      ),
    );
  }

  _buildListItem(String locationName, String imgPath, String map, String rating,
      Color cardColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: cardColor,
              boxShadow: Styles.boxShadows),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: locationName,
                  child: Container(
                    height: 95,
                    width: 95,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgPath), fit: BoxFit.fill),
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: Styles.boxShadows),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 65,
                      child: Text(
                        locationName,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // padding: const EdgeInsets.all(8),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: Styles.boxShadows,
                            ),
                            child: const Icon(
                              Icons.heart_broken,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 65,
                      child: Text(
                        map,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                          ),
                          Text(
                            rating,
                            style: const TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
