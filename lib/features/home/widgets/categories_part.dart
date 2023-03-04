// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/constants/color.dart';
import 'package:news_app/constants/model_constant.dart';

class CategoriesPart extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategoriesPart(
    this.onCategorySelected, {
    Key? key,
  }) : super(key: key);

  @override
  State<CategoriesPart> createState() => _CategoriesPartState();
}

class _CategoriesPartState extends State<CategoriesPart> {
  int i = 0;

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
              GestureDetector(
                onTap: () {
                  setState(() => i = index);
                  widget.onCategorySelected(listCategory[i]);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: index == i ? primary : secondary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.deblur,
                    color: Colors.white,
                  ),
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
