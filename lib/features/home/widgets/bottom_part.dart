import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  final state;
  const BottomPart(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Stories',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
          ...List.generate(
            20,
            (index) => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: 95,
              width: double.infinity,
              child: Row(
                children: [
                  Image.network(
                    state.data[index].urlToImage ?? '',
                    height: 95,
                    width: 116,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/error.jpg',
                      height: 95,
                      width: 116,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 17),
                  SizedBox(
                    width: 180,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.data[index].title ?? 'No Title',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'Read News',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 0,
                          width: 50,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
