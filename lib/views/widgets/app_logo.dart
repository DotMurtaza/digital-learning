import 'package:flutter/material.dart';
import 'package:online_academy/constants/colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // height: MediaQuery.of(context).size.height * 0.25,
      width: size.width * 0.42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 12),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.09,
                  width: size.width * 0.18,
                  decoration: const BoxDecoration(
                    color: ColorsClass.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.add_location_alt_sharp,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: size.height * 0.09,
                  width: size.width * 0.18,
                  decoration: const BoxDecoration(
                    color: ColorsClass.primaryColor,
                    // shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.query_builder_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.09,
                  width: size.width * 0.18,
                  decoration: const BoxDecoration(
                    color: ColorsClass.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.school,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: size.height * 0.09,
                  width: size.width * 0.18,
                  decoration: const BoxDecoration(
                      color: ColorsClass.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 12)
                      ]
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(12),
                      // ),
                      ),
                  child: const Icon(
                    Icons.videocam_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
