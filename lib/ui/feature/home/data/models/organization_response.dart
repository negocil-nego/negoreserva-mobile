import 'category_response.dart';

class OrganizationResponse {
  final String uuid;
  final String name;
  final String slug;
  final String email;
  final String? description;
  final String phone;
  final String? address;
  final String province;
  final String municipality;
  final double? rating;
  final String? logo;
  final String? image;
  final String? video;
  final bool? isHighlight;
  final List<CategoryResponse> categories;

  OrganizationResponse({
    required this.uuid,
    required this.name,
    required this.slug,
    required this.email,
    this.description,
    required this.phone,
    this.address,
    required this.province,
    required this.municipality,
    this.rating,
    this.logo,
    this.image,
    this.video,
    this.isHighlight,
    required this.categories,
  });

  factory OrganizationResponse.fromJson(Map<String, dynamic> json) {
    var categoryList = <CategoryResponse>[];
    if (json['categories'] != null) {
      categoryList = (json['categories'] as List)
          .map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    // rating could be a double, int, or String
    double? parsedRating;
    if (json['rating'] != null) {
      if (json['rating'] is num) {
        parsedRating = (json['rating'] as num).toDouble();
      } else {
        parsedRating = double.tryParse(json['rating'].toString());
      }
    }

    return OrganizationResponse(
      uuid: json['uuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      email: json['email'] as String? ?? '',
      description: json['description'] as String?,
      phone: json['phone'] as String? ?? '',
      address: json['address'] as String?,
      province: json['province'] as String? ?? '',
      municipality: json['municipality'] as String? ?? '',
      rating: parsedRating,
      logo: json['logo'] as String?,
      image: json['image'] as String?,
      video: json['video'] as String?,
      isHighlight: json['isHighlight'] as bool?,
      categories: categoryList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'slug': slug,
      'email': email,
      if (description != null) 'description': description,
      'phone': phone,
      if (address != null) 'address': address,
      'province': province,
      'municipality': municipality,
      if (rating != null) 'rating': rating,
      if (logo != null) 'logo': logo,
      if (image != null) 'image': image,
      if (video != null) 'video': video,
      if (isHighlight != null) 'isHighlight': isHighlight,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }
}
