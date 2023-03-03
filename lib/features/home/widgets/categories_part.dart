import 'package:flutter/material.dart';
import 'package:news_app/constants/color.dart';
import 'package:news_app/constants/model_constant.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 34),
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemCount: listCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.deblur,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(listCategory[index])
            ],
          ),
        ),
      ),
    );
  }
}
