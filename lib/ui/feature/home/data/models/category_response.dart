class CategoryResponse {
  final String uuid;
  final String name;
  final String? icon;

  CategoryResponse({
    required this.uuid,
    required this.name,
    this.icon,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      uuid: json['uuid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      if (icon != null) 'icon': icon,
    };
  }
}
