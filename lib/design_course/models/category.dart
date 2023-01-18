class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;

  static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/images/tet.webp',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/images/tet2.jpg',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/images/tet3.jpg',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/images/tet4.jpg',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> popularCourseList = <Category>[
    Category(
      imagePath: 'assets/images/tet.webp',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/images/tet2.jpg',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/images/tet3.jpg',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/images/tet4.jpg',
      title: 'Tết Nguyên Đán 2023',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];
}
