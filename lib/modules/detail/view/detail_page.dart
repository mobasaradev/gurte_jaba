import 'package:flutter/material.dart';
import 'package:gurte_jaba/modules/detail/widgets/custom_button.dart';
import 'package:gurte_jaba/modules/widgets/custom_button.dart';
import 'package:gurte_jaba/theme/app_color_theme.dart';
import 'package:gurte_jaba/theme/app_text_theme.dart';
import 'package:gurte_jaba/utils/asset_paths.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStar = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetPaths.mountain2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Yosemite",
                          style: AppTextTheme.common.headlineLarge!.copyWith(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "\$ 250",
                          style: AppTextTheme.common.headlineLarge!.copyWith(
                            color: AppColorTheme.mainColor,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColorTheme.mainColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "USA, CALiFORNIA",
                          style: AppTextTheme.common.bodySmall!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColorTheme.textColor1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: gottenStar > index
                                  ? AppColorTheme.starColor
                                  : AppColorTheme.textColor2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "(4.0)",
                          style: AppTextTheme.common.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColorTheme.textColor2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "People",
                      style: AppTextTheme.common.headlineLarge!.copyWith(
                        color: Colors.black.withOpacity(.8),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Number of people in your group",
                      style: AppTextTheme.common.bodySmall!.copyWith(
                        color: AppColorTheme.textColor2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: CustomContainerButton(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColorTheme.buttonBackGround,
                              bgColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColorTheme.buttonBackGround,
                              size: 50,
                              text: (index + 1).toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Description",
                      style: AppTextTheme.common.headlineLarge!.copyWith(
                        color: Colors.black.withOpacity(.8),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "We travel, some of us forever, to seek other states, other lives, other souls. Life is an adventure, it's not a package tour.",
                      style: AppTextTheme.common.bodySmall!.copyWith(
                        color: AppColorTheme.textColor2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainerButton(
                    color: AppColorTheme.textColor1,
                    borderColor: AppColorTheme.textColor1,
                    bgColor: Colors.white,
                    size: 60,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: 20),
                  CustomButton(
                    isResponsive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
