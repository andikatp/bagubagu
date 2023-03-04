// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:news_app/models/data_model.dart';

import '../../../constants/model_constant.dart';

class BottomPart extends StatelessWidget {
  final Articles article;
  const BottomPart({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PanelController controller = PanelController();
    return SlidingUpPanel(
      controller: controller,
      minHeight: MediaQuery.of(context).size.height * 0.5,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      panelBuilder: (sc) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 30),
        child: ListView(
          controller: sc,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: NetworkImage(dummyFoto)),
                const SizedBox(width: 10),
                Text(
                  article.author ?? 'No Author',
                  style: const TextStyle(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(article.content ??
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vehicula auctor efficitur. Sed vitae gravida magna. Duis ultricies nisi at porta dapibus. Quisque odio purus, elementum nec metus in, auctor lobortis sapien. Phasellus sed dui sapien. Nunc sit amet cursus mauris, at suscipit tortor. Aliquam eget nisi arcu. Phasellus rutrum velit non velit sollicitudin, a semper leo facilisis. Nunc enim justo, tincidunt a rhoncus vitae, euismod sit amet neque. Praesent vel condimentum urna, nec fermentum nunc. Aenean blandit vestibulum metus id suscipit. Nulla placerat sed justo vitae imperdiet. In vitae suscipit metus. Nunc gravida, urna et pretium convallis, orci magna finibus est, ornare consectetur eros arcu et nibh. Maecenas a porta nunc, at sollicitudin nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec in lacus sem. Donec et pharetra orci. Vestibulum at sem posuere, finibus lacus quis, porta ipsum. Ut consequat, sem ut gravida faucibus, nibh neque fermentum libero, sit amet malesuada dui ante in ligula. Duis nec condimentum turpis, ac efficitur erat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla suscipit ante ligula, et pharetra libero volutpat nec. Praesent malesuada ultricies lectus, sit amet molestie odio placerat ut. Integer in lectus at dui porttitor faucibus non ut sem. Duis auctor eleifend consectetur. Nam at posuere mi, sed dignissim magna. Sed mauris est, dignissim sit amet iaculis condimentum, efficitur sed odio. Curabitur dignissim, justo ut interdum sodales, velit magna euismod diam, quis viverra nisl urna eget augue. Duis et justo arcu. Integer lobortis mattis lectus a facilisis. In efficitur hendrerit consequat. Nulla feugiat interdum sapien ut ultrices. Vestibulum lobortis tincidunt tempus. Integer efficitur sodales interdum. Curabitur imperdiet sapien eget purus tristique, ut pellentesque lorem facilisis. Morbi rhoncus erat nec blandit aliquet. Vivamus porttitor viverra ante, gravida congue ipsum luctus et.')
          ],
        ),
      ),
    );
  }
}
