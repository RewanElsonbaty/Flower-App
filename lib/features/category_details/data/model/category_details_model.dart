
class MilkShakeModel  {
  final String image;
  final String title;

  MilkShakeModel(
      {
        required this.title,
        required this.image,

      }
      );

}

List<MilkShakeModel> milkshakeList = [
  MilkShakeModel(title: "Oreo Milkshake", image: "assets/images/img_3.png"),
  MilkShakeModel(title: "Vanilla Milkshake", image: "assets/images/img_5.png"),
  MilkShakeModel(title: "Chocolate Milkshake", image: "assets/images/img_6.png"),
  MilkShakeModel(title: "Mango Milkshake", image: "assets/images/img_7.png"),
  MilkShakeModel(title: "Chocolate Milkshake", image: "assets/images/img_6.png"),
  MilkShakeModel(title: "Vanilla Milkshake", image: "assets/images/img_5.png"),
] ;
