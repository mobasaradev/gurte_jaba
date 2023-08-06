import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gurte_jaba/modules/cubit/app_cubit.dart';
import 'package:gurte_jaba/modules/modules.dart';
import 'package:gurte_jaba/theme/theme.dart';

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
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          DetailState detail = state as DetailState;
          return SizedBox(
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/${detail.places.img}',
                        ),
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
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
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
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              detail.places.name,
                              style:
                                  AppTextTheme.common.headlineLarge!.copyWith(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "\$ ${detail.places.price}",
                              style:
                                  AppTextTheme.common.headlineLarge!.copyWith(
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
                              detail.places.location,
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
                                  color: detail.places.stars > index
                                      ? AppColorTheme.starColor
                                      : AppColorTheme.textColor2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "(5.0)",
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
                          detail.places.people.toString(),
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
                          detail.places.description,
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
          );
        },
      ),
    );
  }
}
