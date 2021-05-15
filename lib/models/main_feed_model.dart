class MainFeed {
  List<Feed> feed;

  MainFeed({this.feed});

  MainFeed.fromJson(Map<String, dynamic> json) {
    if (json['feed'] != null) {
      feed = new List<Feed>();
      json['feed'].forEach((v) {
        feed.add(new Feed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feed != null) {
      data['feed'] = this.feed.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Feed {
  int id;
  String title;
  String content;
  String fcontent;
  String excerpt;
  String category;
  String date;
  String slug;
  FeaturedImage featuredImage;

  Feed(
      {this.id,
      this.title,
      this.content,
      this.fcontent,
      this.excerpt,
      this.category,
      this.date,
      this.slug,
      this.featuredImage});

  Feed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    fcontent = json['fcontent'];
    excerpt = json['excerpt'];
    category = json['category'];
    date = json['date'];
    slug = json['slug'];
    featuredImage = json['featured_image'] != null
        ? new FeaturedImage.fromJson(json['featured_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['fcontent'] = this.fcontent;
    data['excerpt'] = this.excerpt;
    data['category'] = this.category;
    data['date'] = this.date;
    data['slug'] = this.slug;
    if (this.featuredImage != null) {
      data['featured_image'] = this.featuredImage.toJson();
    }
    return data;
  }
}

class FeaturedImage {
  String large;

  FeaturedImage({this.large});

  FeaturedImage.fromJson(Map<String, dynamic> json) {
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['large'] = this.large;
    return data;
  }
}
