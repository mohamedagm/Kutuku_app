class BoardingModel {
  final String imageLink;
  final String title;
  final String sub;

  BoardingModel({
    required this.imageLink,
    required this.title,
    required this.sub,
  });
}

List<BoardingModel> boardingList = [
  BoardingModel(
    imageLink: 'assets/images/shoes1.png',
    title: 'Start Journey\n With Nike',
    sub: 'Smart, Gorgeous & Fashionable Collection',
  ),
  BoardingModel(
    imageLink: 'assets/images/shoes2.png',
    title: 'Follow Latest\n Style Shoes',
    sub: 'There Are Many Beautiful And Attractive Plants To Your Room',
  ),
  BoardingModel(
    imageLink: 'assets/images/shoes3.png',
    title: 'Summer Shoes\n Nike 2022',
    sub: 'Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor',
  ),
];
