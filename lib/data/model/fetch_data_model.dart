class HomeData {
  final List<BannerItem> banners;
  final List<Product> recentViews;
  final List<Product> ourProducts;
  final List<Product> suggestedProducts;
  final List<Product> bestSeller;
  final List<Product> flashSale;
  final List<Category> categories;
  final List<Category> topAccessories;
  final List<Category> featuredBrands;
  final int cartCount;
  final int wishlistCount;
  final Currency currency;
  final int notificationCount;

  HomeData({
    required this.banners,
    required this.recentViews,
    required this.ourProducts,
    required this.suggestedProducts,
    required this.bestSeller,
    required this.flashSale,
    required this.categories,
    required this.topAccessories,
    required this.featuredBrands,
    required this.cartCount,
    required this.wishlistCount,
    required this.currency,
    required this.notificationCount,
  });
}

class BannerItem {
  final int id;
  final int linkType;
  final String linkValue;
  final String image;
  final String title;
  final String subTitle;

  BannerItem({
    required this.id,
    required this.linkType,
    required this.linkValue,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'] ?? 0,
      linkType: json['link_type'] ?? 0,
      linkValue: json['link_value'] ?? '',
      image: 'https://swan.alisonsnewdemo.online/images/banner/${json['image'] ?? ''}', // Prefix the image URL
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? '',
    );
  }
}

class Product {
  final int productId;
  final String slug;
  final String code;
  final String name;
  final String store;
  final String manufacturer;
  final String oldPrice;
  final String price;
  final String image;

  Product({
    required this.productId,
    required this.slug,
    required this.code,
    required this.name,
    required this.store,
    required this.manufacturer,
    required this.oldPrice,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] ?? 0,
      slug: json['slug'] ?? '',
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      store: json['store'] ?? '',
      manufacturer: json['manufacturer'] ?? '',
      oldPrice: json['oldprice'] ?? '',
      price: json['price'] ?? '',
      image: 'https://swan.alisonsnewdemo.online/images/product/${json['image']??"assets/images/bg_login.png"}',
    );
  }
}

class Category {
  final int id;
  final String slug;
  final String image;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.slug,
    required this.image,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      slug: json['slug'] ?? '',
      image: 'https://swan.alisonsnewdemo.online/images/category/${json['image'] ?? ''}', // Prefix the image URL
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class Currency {
  final String name;
  final String code;
  final String symbolLeft;
  final String symbolRight;
  final String value;
  final int status;

  Currency({
    required this.name,
    required this.code,
    required this.symbolLeft,
    required this.symbolRight,
    required this.value,
    required this.status,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      symbolLeft: json['symbol_left'] ?? '',
      symbolRight: json['symbol_right'] ?? '',
      value: json['value'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class FetchDataModel {
  final List<BannerItem> banners;
  final List<Product> recentViews;
  final List<Product> ourProducts;
  final List<Product> suggestedProducts;
  final List<Product> bestSeller;
  final List<Product> flashSale;
  final List<Category> categories;
  final List<Category> topAccessories;
  final List<Category> featuredBrands;
  final int cartCount;
  final int wishlistCount;
  final Currency currency;
  final int notificationCount;

  FetchDataModel({
    required this.banners,
    required this.recentViews,
    required this.ourProducts,
    required this.suggestedProducts,
    required this.bestSeller,
    required this.flashSale,
    required this.categories,
    required this.topAccessories,
    required this.featuredBrands,
    required this.cartCount,
    required this.wishlistCount,
    required this.currency,
    required this.notificationCount,
  });

  factory FetchDataModel.fromJson(Map<String, dynamic> json) {
    return FetchDataModel(
      banners: (json['banner1'] as List<dynamic>? ?? [])
          .map((item) => BannerItem.fromJson(item)).toList(),
      recentViews: (json['recentviews'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item)).toList(),
      ourProducts: (json['our_products'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item)).toList(),
      suggestedProducts: (json['suggested_products'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item)).toList(),
      bestSeller: (json['best_seller'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item)).toList(),
      flashSale: (json['flash_sale'] as List<dynamic>? ?? [])
          .map((item) => Product.fromJson(item)).toList(),
      categories: (json['categories'] as List<dynamic>? ?? [])
          .map((item) => Category.fromJson(item)).toList(),
      topAccessories: (json['top_accessories'] as List<dynamic>? ?? [])
          .map((item) => Category.fromJson(item)).toList(),
      featuredBrands: (json['featured_brands'] as List<dynamic>? ?? [])
          .map((item) => Category.fromJson(item)).toList(),
      cartCount: json['cart_count'] ?? 0,
      wishlistCount: json['wishlist_count'] ?? 0,
      currency: Currency.fromJson(json['currency'] ?? {}),
      notificationCount: json['notification_count'] ?? 0,
    );
  }
}
