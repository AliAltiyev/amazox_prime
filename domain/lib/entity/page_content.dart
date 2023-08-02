import 'package:domain/domain.dart';

class PageContent extends Equatable {
  final String image;
  final String title;
  final String description;

  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
          image: ImagePaths.onBoardingFirst,
          title: 'Brand new curriculum',
          description:
              'This is the first online education platform designed by the '
              "world's top professors.",
        );

  const PageContent.second()
      : this(
          image: ImagePaths.onBoardingSecond,
          title: 'Brand a fun atmosphere',
          description:
              'This is the first online education platform designed by the '
              "world's top professors.",
        );

  const PageContent.third()
      : this(
          image: ImagePaths.onBoardingThird,
          title: 'Easy to join the lesson',
          description:
              'This is the first online education platform designed by the '
              "world's top professors.",
        );

  @override
  List<Object?> get props => [
        image,
        title,
        description,
      ];
}
