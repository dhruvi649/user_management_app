import 'package:flutter/material.dart';
import '../../../base/utils/constants/asset_constants.dart';
import '../../../base/utils/constants/color_constants.dart';

class CustomBackGroundImage extends StatelessWidget {

  final Widget child;

  const CustomBackGroundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundeColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            kBackgroundeColor.withOpacity(0.1),
            BlendMode.dstATop,
          ),
          image: const NetworkImage(backGroundImage),
        ),
      ),
      child: child,
    );
  }
}
