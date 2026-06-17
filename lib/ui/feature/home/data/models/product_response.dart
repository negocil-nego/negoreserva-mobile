import 'organization_response.dart';

class ProductResponse {
  final String uuid;
  final String name;
  final String slug;
  final String description;
  final String? image;
  final double price;
  final OrganizationResponse organization;

  ProductResponse({
    required this.uuid,
    required this.name,
    required this.slug,
    required this.description,
    this.image,
    required this.price,
    required this.organization,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    // parse price safely
    double parsedPrice = 0.0;
    if (json['price'] != null) {
      if (json['price'] is num) {
        parsedPrice = (json['price'] as num).toDouble();
      } else {
        parsedPrice = double.tryParse(json['price'].toString()) ?? 0.0;
      }
    }

    return ProductResponse(
      uuid: json['uuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      image: json['image'] as String?,
      price: parsedPrice,
      organization: OrganizationResponse.fromJson(
          json['organization'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'slug': slug,
      'description': description,
      if (image != null) 'image': image,
      'price': price,
      'organization': organization.toJson(),
    };
  }
}
