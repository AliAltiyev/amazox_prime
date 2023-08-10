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
          title: 'Еда, полезная для вас и планеты',
          description: 'Amazox Prime: Еда, которая объединяет людей.',
        );

  const PageContent.second()
      : this(
    image: ImagePaths.onBoardingSecond,
          title: 'Еда, которая делает вас счастливым',
          description: 'Еда, которую вы любите, доставлена ​​к вашей двери',
        );

  const PageContent.third()
      : this(
    image: ImagePaths.onBoardingThird,
          title: """
Доставка еды: быстрая, свежая и доступная""",
          description: """
Еда, которая стоит ожидания""",
        );

  @override
  List<Object?> get props => [
        image,
        title,
        description,
      ];
}
