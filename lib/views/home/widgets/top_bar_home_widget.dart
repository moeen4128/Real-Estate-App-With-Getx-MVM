import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:real_estate/res/assets/image_assets.dart';
import 'package:real_estate/res/theme/text_theme_style.dart';
import 'package:real_estate/utils/app_constants.dart';
import 'package:real_estate/utils/gaps.dart';
import 'package:real_estate/views/home/widgets/search_widget.dart';

class TopBarHomWidget extends StatelessWidget {
  const TopBarHomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.verticalGapOf(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppConstants.appName,
              style: AppTextStyles.poppinsTitle(),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.elliptical(20, 20)),
              child: SvgPicture.asset(
                ImageAssets.userPic,
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
        Gaps.verticalGapOf(30),
        const SearchContainerWidget(),
      ],
    );
  }
}
