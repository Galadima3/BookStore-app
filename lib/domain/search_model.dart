// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);


// import 'dart:convert';

// SearchModel? searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

// String searchModelToJson(SearchModel? data) => json.encode(data!.toJson());

class SearchModel {
    SearchModel({
        required this.items,
    });

    final List<Item?>? items;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        items: json["items"] == null ? [] : List<Item?>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x!.toJson())),
    };

 
}

class Item {
    Item({
        required this.volumeInfo,
    });

    final VolumeInfo? volumeInfo;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "volumeInfo": volumeInfo!.toJson(),
    };
}

class VolumeInfo {
    VolumeInfo({
        required this.title,
        required this.subtitle,
        required this.authors,
        required this.publisher,
        required this.publishedDate,
        required this.description,
        required this.industryIdentifiers,
        required this.readingModes,
        required this.pageCount,
        required this.printType,
        required this.categories,
        required this.maturityRating,
        required this.allowAnonLogging,
        required this.contentVersion,
        required this.imageLinks,
        required this.language,
        required this.previewLink,
        required this.infoLink,
        required this.canonicalVolumeLink,
    });

    final String? title;
    final String? subtitle;
    final List<String?>? authors;
    final String? publisher;
    final DateTime? publishedDate;
    final String? description;
    final List<IndustryIdentifier?>? industryIdentifiers;
    final ReadingModes? readingModes;
    final int? pageCount;
    final String? printType;
    final List<String?>? categories;
    final String? maturityRating;
    final bool? allowAnonLogging;
    final String? contentVersion;
    final ImageLinks? imageLinks;
    final String? language;
    final String? previewLink;
    final String? infoLink;
    final String? canonicalVolumeLink;

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        subtitle: json["subtitle"],
        authors: json["authors"] == null ? [] : List<String?>.from(json["authors"]!.map((x) => x)),
        publisher: json["publisher"],
        publishedDate: DateTime.parse(json["publishedDate"]),
        description: json["description"],
        industryIdentifiers: json["industryIdentifiers"] == null ? [] : List<IndustryIdentifier?>.from(json["industryIdentifiers"]!.map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: json["printType"],
        categories: json["categories"] == null ? [] : List<String?>.from(json["categories"]!.map((x) => x)),
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x)),
        "publisher": publisher,
        "publishedDate": "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "description": description,
        "industryIdentifiers": industryIdentifiers == null ? [] : List<dynamic>.from(industryIdentifiers!.map((x) => x!.toJson())),
        "readingModes": readingModes!.toJson(),
        "pageCount": pageCount,
        "printType": printType,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
        "maturityRating": maturityRating,
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "imageLinks": imageLinks!.toJson(),
        "language": language,
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
    };
}

class ImageLinks {
    ImageLinks({
        required this.smallThumbnail,
        required this.thumbnail,
    });

    final String? smallThumbnail;
    final String? thumbnail;

    factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "thumbnail": thumbnail,
    };
}

class IndustryIdentifier {
    IndustryIdentifier({
        required this.type,
        required this.identifier,
    });

    final String? type;
    final String? identifier;

    factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: json["type"],
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "identifier": identifier,
    };
}

class ReadingModes {
    ReadingModes({
        required this.text,
        required this.image,
    });

    final bool? text;
    final bool? image;

    factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
    };
}
