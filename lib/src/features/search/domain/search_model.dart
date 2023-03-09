// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);


// ignore_for_file: constant_identifier_names

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    SearchModel({
        required this.kind,
        required this.totalItems,
        required this.items,
    });

    final String kind;
    final int totalItems;
    final List<Item> items;

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        kind: json["kind"],
        totalItems: json["totalItems"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "totalItems": totalItems,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        required this.kind,
        required this.id,
        required this.etag,
        required this.selfLink,
        required this.volumeInfo,
        required this.saleInfo,
        required this.accessInfo,
        required this.searchInfo,
    });

    final Kind kind;
    final String id;
    final String etag;
    final String selfLink;
    final VolumeInfo volumeInfo;
    final SaleInfo saleInfo;
    final AccessInfo accessInfo;
    final SearchInfo searchInfo;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: kindValues.map[json["kind"]]!,
        id: json["id"],
        etag: json["etag"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
        accessInfo: AccessInfo.fromJson(json["accessInfo"]),
        searchInfo: SearchInfo.fromJson(json["searchInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "id": id,
        "etag": etag,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo.toJson(),
        "saleInfo": saleInfo.toJson(),
        "accessInfo": accessInfo.toJson(),
        "searchInfo": searchInfo.toJson(),
    };
}

class AccessInfo {
    AccessInfo({
        required this.country,
        required this.viewability,
        required this.embeddable,
        required this.publicDomain,
        required this.textToSpeechPermission,
        required this.epub,
        required this.pdf,
        required this.webReaderLink,
        required this.accessViewStatus,
        required this.quoteSharingAllowed,
    });

    final Country country;
    final Viewability viewability;
    final bool embeddable;
    final bool publicDomain;
    final TextToSpeechPermission textToSpeechPermission;
    final Epub epub;
    final Epub pdf;
    final String webReaderLink;
    final AccessViewStatus accessViewStatus;
    final bool quoteSharingAllowed;

    factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
        country: countryValues.map[json["country"]]!,
        viewability: viewabilityValues.map[json["viewability"]]!,
        embeddable: json["embeddable"],
        publicDomain: json["publicDomain"],
        textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]]!,
        epub: Epub.fromJson(json["epub"]),
        pdf: Epub.fromJson(json["pdf"]),
        webReaderLink: json["webReaderLink"],
        accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]]!,
        quoteSharingAllowed: json["quoteSharingAllowed"],
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "viewability": viewabilityValues.reverse[viewability],
        "embeddable": embeddable,
        "publicDomain": publicDomain,
        "textToSpeechPermission": textToSpeechPermissionValues.reverse[textToSpeechPermission],
        "epub": epub.toJson(),
        "pdf": pdf.toJson(),
        "webReaderLink": webReaderLink,
        "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
        "quoteSharingAllowed": quoteSharingAllowed,
    };
}

enum AccessViewStatus { NONE }

final accessViewStatusValues = EnumValues({
    "NONE": AccessViewStatus.NONE
});

enum Country { NG }

final countryValues = EnumValues({
    "NG": Country.NG
});

class Epub {
    Epub({
        required this.isAvailable,
    });

    final bool isAvailable;

    factory Epub.fromJson(Map<String, dynamic> json) => Epub(
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "isAvailable": isAvailable,
    };
}

enum TextToSpeechPermission { ALLOWED }

final textToSpeechPermissionValues = EnumValues({
    "ALLOWED": TextToSpeechPermission.ALLOWED
});

enum Viewability { NO_PAGES }

final viewabilityValues = EnumValues({
    "NO_PAGES": Viewability.NO_PAGES
});

enum Kind { BOOKS_VOLUME }

final kindValues = EnumValues({
    "books#volume": Kind.BOOKS_VOLUME
});

class SaleInfo {
    SaleInfo({
        required this.country,
        required this.saleability,
        required this.isEbook,
    });

    final Country country;
    final Saleability saleability;
    final bool isEbook;

    factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: countryValues.map[json["country"]]!,
        saleability: saleabilityValues.map[json["saleability"]]!,
        isEbook: json["isEbook"],
    );

    Map<String, dynamic> toJson() => {
        "country": countryValues.reverse[country],
        "saleability": saleabilityValues.reverse[saleability],
        "isEbook": isEbook,
    };
}

enum Saleability { NOT_FOR_SALE }

final saleabilityValues = EnumValues({
    "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
});

class SearchInfo {
    SearchInfo({
        required this.textSnippet,
    });

    final String textSnippet;

    factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
        textSnippet: json["textSnippet"],
    );

    Map<String, dynamic> toJson() => {
        "textSnippet": textSnippet,
    };
}

class VolumeInfo {
    VolumeInfo({
        required this.title,
        required this.authors,
        required this.publishedDate,
        required this.industryIdentifiers,
        required this.readingModes,
        required this.pageCount,
        required this.printType,
        required this.categories,
        required this.maturityRating,
        required this.allowAnonLogging,
        required this.contentVersion,
        required this.panelizationSummary,
        required this.imageLinks,
        required this.language,
        required this.previewLink,
        required this.infoLink,
        required this.canonicalVolumeLink,
        required this.subtitle,
        required this.publisher,
        required this.description,
    });

    final String title;
    final List<String> authors;
    final String publishedDate;
    final List<IndustryIdentifier> industryIdentifiers;
    final ReadingModes readingModes;
    final int pageCount;
    final PrintType printType;
    final List<String> categories;
    final MaturityRating maturityRating;
    final bool allowAnonLogging;
    final String contentVersion;
    final PanelizationSummary panelizationSummary;
    final ImageLinks imageLinks;
    final Language language;
    final String previewLink;
    final String infoLink;
    final String canonicalVolumeLink;
    final String subtitle;
    final String publisher;
    final String description;

    factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        publishedDate: json["publishedDate"],
        industryIdentifiers: List<IndustryIdentifier>.from(json["industryIdentifiers"].map((x) => IndustryIdentifier.fromJson(x))),
        readingModes: ReadingModes.fromJson(json["readingModes"]),
        pageCount: json["pageCount"],
        printType: printTypeValues.map[json["printType"]]!,
        categories: List<String>.from(json["categories"].map((x) => x)),
        maturityRating: maturityRatingValues.map[json["maturityRating"]]!,
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        panelizationSummary: PanelizationSummary.fromJson(json["panelizationSummary"]),
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: languageValues.map[json["language"]]!,
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
        subtitle: json["subtitle"],
        publisher: json["publisher"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "authors": List<dynamic>.from(authors.map((x) => x)),
        "publishedDate": publishedDate,
        "industryIdentifiers": List<dynamic>.from(industryIdentifiers.map((x) => x.toJson())),
        "readingModes": readingModes.toJson(),
        "pageCount": pageCount,
        "printType": printTypeValues.reverse[printType],
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "maturityRating": maturityRatingValues.reverse[maturityRating],
        "allowAnonLogging": allowAnonLogging,
        "contentVersion": contentVersion,
        "panelizationSummary": panelizationSummary.toJson(),
        "imageLinks": imageLinks.toJson(),
        "language": languageValues.reverse[language],
        "previewLink": previewLink,
        "infoLink": infoLink,
        "canonicalVolumeLink": canonicalVolumeLink,
        "subtitle": subtitle,
        "publisher": publisher,
        "description": description,
    };
}

class ImageLinks {
    ImageLinks({
        required this.smallThumbnail,
        required this.thumbnail,
    });

    final String smallThumbnail;
    final String thumbnail;

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

    final Type type;
    final String identifier;

    factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
        type: typeValues.map[json["type"]]!,
        identifier: json["identifier"],
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "identifier": identifier,
    };
}

enum Type { OTHER, ISBN_13, ISBN_10 }

final typeValues = EnumValues({
    "ISBN_10": Type.ISBN_10,
    "ISBN_13": Type.ISBN_13,
    "OTHER": Type.OTHER
});

enum Language { EN }

final languageValues = EnumValues({
    "en": Language.EN
});

enum MaturityRating { NOT_MATURE }

final maturityRatingValues = EnumValues({
    "NOT_MATURE": MaturityRating.NOT_MATURE
});

class PanelizationSummary {
    PanelizationSummary({
        required this.containsEpubBubbles,
        required this.containsImageBubbles,
    });

    final bool containsEpubBubbles;
    final bool containsImageBubbles;

    factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
        containsEpubBubbles: json["containsEpubBubbles"],
        containsImageBubbles: json["containsImageBubbles"],
    );

    Map<String, dynamic> toJson() => {
        "containsEpubBubbles": containsEpubBubbles,
        "containsImageBubbles": containsImageBubbles,
    };
}

enum PrintType { BOOK }

final printTypeValues = EnumValues({
    "BOOK": PrintType.BOOK
});

class ReadingModes {
    ReadingModes({
        required this.text,
        required this.image,
    });

    final bool text;
    final bool image;

    factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
        text: json["text"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
