import 'package:flutter/material.dart';
import 'package:gogotrip/screens/test_page/test_screen.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 376,
      height: 100,
      child: Row(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 34, left: 15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28)),
                  child: const Icon(Icons.density_medium),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 65,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("location",
                      style:
                      TextStyle(fontFamily: 'Nunito', fontSize: 18)),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on_outlined),
                        SizedBox( width: 2,),
                        Text("My locaion")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestPage(),
                    ));
              },
                child: Container(
                  child: Text("test",style: TextStyle(color: Colors.green),),
                )),
          ),
        ],
      ),
    );
  }
}
