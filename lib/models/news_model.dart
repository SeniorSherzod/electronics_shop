class News {
  final String id; // Add id field

  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;

  News({
    required this.id, // Update constructor to include id
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] ?? '', // Assign id from JSON
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      date: DateTime.parse(json['date'] ?? ''),
    );
  }

  // Getter for id
  String get getId => id;

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Include id in JSON serialization
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'date': date.toIso8601String(),
    };
  }
}
