import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption:
          'Lorem excepteur est ipsum et nostrud commodo velit nostrud ad non est.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption:
          'Eiusmod officia reprehenderit ut dolore in veniam dolor pariatur esse.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption: 'Minim deserunt officia non enim cillum.',
      imageUrl: 'assets/images/3.png')
];

class AppTutorial extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorial({super.key});

  @override
  State<AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<AppTutorial> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewController.addListener(() {
      // avoid to use setState here.
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: [
              ...slides
                  .map((e) => _Slide(
                      title: e.title, caption: e.caption, imageUrl: e.imageUrl))
                  .toList()
            ],
          ),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  child: const Text('Skip'), onPressed: () => context.pop())),

          // SizedBox instead of null.
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Start'),
                      onPressed: () => context.pop(),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
          ]),
    );
  }
}
