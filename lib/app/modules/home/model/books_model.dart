// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

Books booksFromJson(String str) => Books.fromJson(json.decode(str));

class Books {
  int? page;
  List<ReadingLogEntry>? readingLogEntries;

  Books({
    this.page,
    this.readingLogEntries,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        page: json["page"],
        readingLogEntries: json["reading_log_entries"] == null
            ? []
            : List<ReadingLogEntry>.from(json["reading_log_entries"]!
                .map((x) => ReadingLogEntry.fromJson(x))),
      );
}

class ReadingLogEntry {
  Work? work;
  RxBool isRead;

  ReadingLogEntry({
    this.work,
    required this.isRead,
  });

  factory ReadingLogEntry.fromJson(Map<String, dynamic> json) =>
      ReadingLogEntry(
        work: json["work"] == null ? null : Work.fromJson(json["work"]),
        isRead: false.obs,
      );
}

class Work {
  String? title;
  String? key;
  List<String>? authorKeys;
  List<String>? authorNames;
  int? firstPublishYear;
  String? lendingEditionS;
  List<String>? editionKey;
  int? coverId;
  String? coverEditionKey;

  Work({
    this.title,
    this.key,
    this.authorKeys,
    this.authorNames,
    this.firstPublishYear,
    this.lendingEditionS,
    this.editionKey,
    this.coverId,
    this.coverEditionKey,
  });

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        title: json["title"],
        key: json["key"],
        authorKeys: json["author_keys"] == null
            ? []
            : List<String>.from(json["author_keys"]!.map((x) => x)),
        authorNames: json["author_names"] == null
            ? []
            : List<String>.from(json["author_names"]!.map((x) => x)),
        firstPublishYear: json["first_publish_year"],
        lendingEditionS: json["lending_edition_s"],
        editionKey: json["edition_key"] == null
            ? []
            : List<String>.from(json["edition_key"]!.map((x) => x)),
        coverId: json["cover_id"],
        coverEditionKey: json["cover_edition_key"],
      );
}
