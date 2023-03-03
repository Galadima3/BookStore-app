// To parse this JSON data, do
//
//     final trendingBooksModel = trendingBooksModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

TrendingBooksModel? trendingBooksModelFromJson(String str) =>
    TrendingBooksModel.fromJson(json.decode(str));

String trendingBooksModelToJson(TrendingBooksModel? data) =>
    json.encode(data!.toJson());

class TrendingBooksModel {
  TrendingBooksModel({
    required this.results,
  });

  final Results? results;

  factory TrendingBooksModel.fromJson(Map<String, dynamic> json) =>
      TrendingBooksModel(
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "results": results!.toJson(),
      };
}

class Results {
  Results({
    required this.bestsellersDate,
    required this.publishedDate,
    required this.publishedDateDescription,
    required this.previousPublishedDate,
    required this.nextPublishedDate,
    required this.lists,
  });

  final DateTime? bestsellersDate;
  final DateTime? publishedDate;
  final String? publishedDateDescription;
  final DateTime? previousPublishedDate;
  final String? nextPublishedDate;
  final List<ListElement?>? lists;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        bestsellersDate: DateTime.parse(json["bestsellers_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        publishedDateDescription: json["published_date_description"],
        previousPublishedDate: DateTime.parse(json["previous_published_date"]),
        nextPublishedDate: json["next_published_date"],
        lists: json["lists"] == null
            ? []
            : List<ListElement?>.from(
                json["lists"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bestsellers_date":
            "${bestsellersDate!.year.toString().padLeft(4, '0')}-${bestsellersDate!.month.toString().padLeft(2, '0')}-${bestsellersDate!.day.toString().padLeft(2, '0')}",
        "published_date":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "published_date_description": publishedDateDescription,
        "previous_published_date":
            "${previousPublishedDate!.year.toString().padLeft(4, '0')}-${previousPublishedDate!.month.toString().padLeft(2, '0')}-${previousPublishedDate!.day.toString().padLeft(2, '0')}",
        "next_published_date": nextPublishedDate,
        "lists": lists == null
            ? []
            : List<dynamic>.from(lists!.map((x) => x!.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.listId,
    required this.listName,
    required this.listNameEncoded,
    required this.displayName,
    required this.updated,
    required this.listImage,
    required this.listImageWidth,
    required this.listImageHeight,
    required this.books,
  });

  final int? listId;
  final String? listName;
  final String? listNameEncoded;
  final String? displayName;
  final Updated? updated;
  final dynamic listImage;
  final dynamic listImageWidth;
  final dynamic listImageHeight;
  final List<Book?>? books;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        listId: json["list_id"],
        listName: json["list_name"],
        listNameEncoded: json["list_name_encoded"],
        displayName: json["display_name"],
        updated: updatedValues.map[json["updated"]],
        listImage: json["list_image"],
        listImageWidth: json["list_image_width"],
        listImageHeight: json["list_image_height"],
        books: json["books"] == null
            ? []
            : List<Book?>.from(json["books"]!.map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list_id": listId,
        "list_name": listName,
        "list_name_encoded": listNameEncoded,
        "display_name": displayName,
        "updated": updatedValues.reverse![updated],
        "list_image": listImage,
        "list_image_width": listImageWidth,
        "list_image_height": listImageHeight,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x!.toJson())),
      };
}

class Book {
  Book({
    required this.ageGroup,
    required this.amazonProductUrl,
    required this.articleChapterLink,
    required this.author,
    required this.bookImage,
    required this.bookImageWidth,
    required this.bookImageHeight,
    required this.bookReviewLink,
    required this.bookUri,
    required this.contributor,
    required this.contributorNote,
    required this.createdDate,
    required this.description,
    required this.firstChapterLink,
    required this.price,
    required this.primaryIsbn10,
    required this.primaryIsbn13,
    required this.publisher,
    required this.rank,
    required this.rankLastWeek,
    required this.sundayReviewLink,
    required this.title,
    required this.updatedDate,
    required this.weeksOnList,
    required this.buyLinks,
  });

  final String? ageGroup;
  final String? amazonProductUrl;
  final String? articleChapterLink;
  final String? author;
  final String? bookImage;
  final int? bookImageWidth;
  final int? bookImageHeight;
  final String? bookReviewLink;
  final String? bookUri;
  final String? contributor;
  final String? contributorNote;
  final DateTime? createdDate;
  final String? description;
  final String? firstChapterLink;
  final String? price;
  final String? primaryIsbn10;
  final String? primaryIsbn13;
  final String? publisher;
  final int? rank;
  final int? rankLastWeek;
  final String? sundayReviewLink;
  final String? title;
  final DateTime? updatedDate;
  final int? weeksOnList;
  final List<BuyLink?>? buyLinks;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        ageGroup: json["age_group"],
        amazonProductUrl: json["amazon_product_url"],
        articleChapterLink: json["article_chapter_link"],
        author: json["author"],
        bookImage: json["book_image"],
        bookImageWidth: json["book_image_width"],
        bookImageHeight: json["book_image_height"],
        bookReviewLink: json["book_review_link"],
        bookUri: json["book_uri"],
        contributor: json["contributor"],
        contributorNote: json["contributor_note"],
        createdDate: DateTime.parse(json["created_date"]),
        description: json["description"],
        firstChapterLink: json["first_chapter_link"],
        price: json["price"],
        primaryIsbn10: json["primary_isbn10"],
        primaryIsbn13: json["primary_isbn13"],
        publisher: json["publisher"],
        rank: json["rank"],
        rankLastWeek: json["rank_last_week"],
        sundayReviewLink: json["sunday_review_link"],
        title: json["title"],
        updatedDate: DateTime.parse(json["updated_date"]),
        weeksOnList: json["weeks_on_list"],
        buyLinks: json["buy_links"] == null
            ? []
            : List<BuyLink?>.from(
                json["buy_links"]!.map((x) => BuyLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "age_group": ageGroup,
        "amazon_product_url": amazonProductUrl,
        "article_chapter_link": articleChapterLink,
        "author": author,
        "book_image": bookImage,
        "book_image_width": bookImageWidth,
        "book_image_height": bookImageHeight,
        "book_review_link": bookReviewLink,
        "book_uri": bookUri,
        "contributor": contributor,
        "contributor_note": contributorNote,
        "created_date": createdDate?.toIso8601String(),
        "description": description,
        "first_chapter_link": firstChapterLink,
        "price": price,
        "primary_isbn10": primaryIsbn10,
        "primary_isbn13": primaryIsbn13,
        "publisher": publisher,
        "rank": rank,
        "rank_last_week": rankLastWeek,
        "sunday_review_link": sundayReviewLink,
        "title": title,
        "updated_date": updatedDate?.toIso8601String(),
        "weeks_on_list": weeksOnList,
        "buy_links": buyLinks == null
            ? []
            : List<dynamic>.from(buyLinks!.map((x) => x!.toJson())),
      };
}

class BuyLink {
  BuyLink({
    required this.name,
    required this.url,
  });

  final Name? name;
  final String? url;

  factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
        name: nameValues.map[json["name"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "url": url,
      };
}

enum Name {
  AMAZON,
  APPLE_BOOKS,
  BARNES_AND_NOBLE,
  BOOKS_A_MILLION,
  BOOKSHOP,
  INDIE_BOUND
}

final nameValues = EnumValues({
  "Amazon": Name.AMAZON,
  "Apple Books": Name.APPLE_BOOKS,
  "Barnes and Noble": Name.BARNES_AND_NOBLE,
  "Bookshop": Name.BOOKSHOP,
  "Books-A-Million": Name.BOOKS_A_MILLION,
  "IndieBound": Name.INDIE_BOUND
});

enum Updated { WEEKLY, MONTHLY }

final updatedValues =
    EnumValues({"MONTHLY": Updated.MONTHLY, "WEEKLY": Updated.WEEKLY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
