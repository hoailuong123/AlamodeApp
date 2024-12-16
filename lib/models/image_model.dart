class ImageModel {
  final int id;
  final String image;
  final bool isMain;
  final String caption;
  final String altText;
  final int order;

  ImageModel({
    required this.id,
    required this.image,
    required this.isMain,
    required this.caption,
    required this.altText,
    required this.order,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      image: json['image'],
      isMain: json['is_main'],
      caption: json['caption'],
      altText: json['alt_text'],
      order: json['order'],
    );
  }
}
