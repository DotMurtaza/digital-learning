import 'package:flutter/material.dart';

class DiaryHeader extends StatelessWidget {
  const DiaryHeader({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      width: size.width,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subject',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Assignment',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text('Due',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
