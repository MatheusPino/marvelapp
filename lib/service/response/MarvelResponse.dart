class MarvelResponse {
  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHTML;
  String etag;
  MarvelData data;

  MarvelResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHTML,
    required this.etag,
    required this.data,
  });

  factory MarvelResponse.fromJson(Map<String, dynamic> json) {
    return MarvelResponse(
      code: json['code'],
      status: json['status'],
      copyright: json['copyright'],
      attributionText: json['attributionText'],
      attributionHTML: json['attributionHTML'],
      etag: json['etag'],
      data: MarvelData.fromJson(json['data']),
    );
  }
}

class MarvelData {
  int offset;
  int limit;
  int total;
  int count;
  List<MarvelResult> results;

  MarvelData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory MarvelData.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List;
    List<MarvelResult> results =
    resultsList.map((result) => MarvelResult.fromJson(result)).toList();

    return MarvelData(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: results,
    );
  }
}

class MarvelResult {
  int id;
  String title;
  String? description;
  String resourceURI;
  List<MarvelUrl> urls;
  int startYear;
  int endYear;
  String rating;
  String type;
  String modified;
  MarvelThumbnail thumbnail;
  MarvelCreators creators;
  MarvelCharacters characters;
  MarvelStories stories;
  MarvelComics comics;
  MarvelEvents events;
  dynamic next;
  dynamic previous;

  MarvelResult({
    required this.id,
    required this.title,
    this.description,
    required this.resourceURI,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.events,
    this.next,
    this.previous,
  });

  factory MarvelResult.fromJson(Map<String, dynamic> json) {
    var urlsList = json['urls'] as List;
    List<MarvelUrl> urls =
    urlsList.map((url) => MarvelUrl.fromJson(url)).toList();

    return MarvelResult(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      resourceURI: json['resourceURI'],
      urls: urls,
      startYear: json['startYear'],
      endYear: json['endYear'],
      rating: json['rating'],
      type: json['type'],
      modified: json['modified'],
      thumbnail: MarvelThumbnail.fromJson(json['thumbnail']),
      creators: MarvelCreators.fromJson(json['creators']),
      characters: MarvelCharacters.fromJson(json['characters']),
      stories: MarvelStories.fromJson(json['stories']),
      comics: MarvelComics.fromJson(json['comics']),
      events: MarvelEvents.fromJson(json['events']),
      next: json['next'],
      previous: json['previous'],
    );
  }
}

class MarvelUrl {
  String type;
  String url;

  MarvelUrl({
    required this.type,
    required this.url,
  });

  factory MarvelUrl.fromJson(Map<String, dynamic> json) {
    return MarvelUrl(
      type: json['type'],
      url: json['url'],
    );
  }
}

class MarvelThumbnail {
  String path;
  String extension;

  MarvelThumbnail({
    required this.path,
    required this.extension,
  });

  factory MarvelThumbnail.fromJson(Map<String, dynamic> json) {
    return MarvelThumbnail(
      path: json['path'],
      extension: json['extension'],
    );
  }
}

class MarvelCreators {
  int available;
  String collectionURI;
  List<MarvelCreatorItem> items;
  int returned;

  MarvelCreators({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  factory MarvelCreators.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<MarvelCreatorItem> items =
    itemsList.map((item) => MarvelCreatorItem.fromJson(item)).toList();

    return MarvelCreators(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: items,
      returned: json['returned'],
    );
  }
}

class MarvelCreatorItem {
  String resourceURI;
  String name;
  String role;

  MarvelCreatorItem({
    required this.resourceURI,
    required this.name,
    required this.role,
  });

  factory MarvelCreatorItem.fromJson(Map<String, dynamic> json) {
    return MarvelCreatorItem(
      resourceURI: json['resourceURI'],
      name: json['name'],
      role: json['role'],
    );
  }
}

class MarvelCharacters {
  int available;
  String collectionURI;
  List<dynamic> items;
  int returned;

  MarvelCharacters({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  factory MarvelCharacters.fromJson(Map<String, dynamic> json) {
    return MarvelCharacters(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: json['items'],
      returned: json['returned'],
    );
  }
}

class MarvelStories {
  int available;
  String collectionURI;
  List<MarvelStoryItem> items;
  int returned;

  MarvelStories({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  factory MarvelStories.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<MarvelStoryItem> items =
    itemsList.map((item) => MarvelStoryItem.fromJson(item)).toList();

    return MarvelStories(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: items,
      returned: json['returned'],
    );
  }
}

class MarvelStoryItem {
  String resourceURI;
  String name;
  String type;

  MarvelStoryItem({
    required this.resourceURI,
    required this.name,
    required this.type,
  });

  factory MarvelStoryItem.fromJson(Map<String, dynamic> json) {
    return MarvelStoryItem(
      resourceURI: json['resourceURI'],
      name: json['name'],
      type: json['type'],
    );
  }
}

class MarvelComics {
  int available;
  String collectionURI;
  List<MarvelComicItem> items;
  int returned;

  MarvelComics({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  factory MarvelComics.fromJson(Map<String, dynamic> json) {
    var itemsList = json['items'] as List;
    List<MarvelComicItem> items =
    itemsList.map((item) => MarvelComicItem.fromJson(item)).toList();

    return MarvelComics(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: items,
      returned: json['returned'],
    );
  }
}

class MarvelComicItem {
  String resourceURI;
  String name;

  MarvelComicItem({
    required this.resourceURI,
    required this.name,
  });

  factory MarvelComicItem.fromJson(Map<String, dynamic> json) {
    return MarvelComicItem(
      resourceURI: json['resourceURI'],
      name: json['name'],
    );
  }
}

class MarvelEvents {
  int available;
  String collectionURI;
  List<dynamic> items;
  int returned;

  MarvelEvents({
    required this.available,
    required this.collectionURI,
    required this.items,
    required this.returned,
  });

  factory MarvelEvents.fromJson(Map<String, dynamic> json) {
    return MarvelEvents(
      available: json['available'],
      collectionURI: json['collectionURI'],
      items: json['items'],
      returned: json['returned'],
    );
  }
}
