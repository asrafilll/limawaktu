import 'package:flutter/material.dart';
import 'package:limawaktu/constant.dart';

class MainHeaderBGComponent extends StatelessWidget {
  const MainHeaderBGComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.32,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Constants.mainBg),
        ),
      ),
    );
  }
}
