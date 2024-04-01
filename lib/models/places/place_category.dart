
class PlaceCategory {
  final String name;

  const PlaceCategory(this.name);

  factory PlaceCategory.fromJson(String json) {
    return PlaceCategory(json);
  }

  String toJson() => name;

  static const PlaceCategory work = PlaceCategory('work');
  static const PlaceCategory home = PlaceCategory('home');
  static const PlaceCategory other = PlaceCategory('other');
}