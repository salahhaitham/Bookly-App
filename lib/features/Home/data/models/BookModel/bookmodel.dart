import 'package:bookly_app/features/Home/Domain/entities/BookEntity.dart';

class BookResponse {
  final String kind;
  final int totalItems;
  final List<BookModel> items;

  BookResponse({
    required this.kind,
    required this.totalItems,
    required this.items,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    return BookResponse(
      kind: json['kind'] ?? '',
      totalItems: json['totalItems'] ?? 0,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BookModel extends BookEntity {
  final String id;
  final String etag;
  final String selfLink;
  final VolumeInfo volumeInfo;
  final SaleInfo saleInfo;
  final AccessInfo accessInfo;

  BookModel({
    required this.id,
    required this.etag,
    required this.selfLink,
    required this.volumeInfo,
    required this.saleInfo,
    required this.accessInfo,
  }) : super(
         Bookid: id,
    image: volumeInfo.imageLinks.thumbnail.isNotEmpty
        ? volumeInfo.imageLinks.thumbnail
        : null,

    authorName: (volumeInfo.authors.isNotEmpty)
        ? volumeInfo.authors.first
        : "Unknown",
         price: 0.0,
    rating: volumeInfo.averageRating ?? 0.0,
         title: volumeInfo.title,
    category:   (volumeInfo.categories.isNotEmpty)
        ? volumeInfo.categories.first
        : "Unknown",
      previewlink: volumeInfo.previewLink,


       );

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? '',
      etag: json['etag'] ?? '',
      selfLink: json['selfLink'] ?? '',
      volumeInfo: VolumeInfo.fromJson(json['volumeInfo'] ?? {}),
      saleInfo: SaleInfo.fromJson(json['saleInfo'] ?? {}),
      accessInfo: AccessInfo.fromJson(json['accessInfo'] ?? {}),
    );
  }
}

class VolumeInfo {
  final String title;
  final String? subtitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final int pageCount;
  final String printType;
  final List<String> categories;
  final double averageRating;
  final int ratingsCount;
  final String maturityRating;
  final bool allowAnonLogging;
  final String contentVersion;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;
  final List<IndustryIdentifier> industryIdentifiers;
  final ReadingModes readingModes;
  final PanelizationSummary panelizationSummary;

  VolumeInfo({
    required this.title,
    this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.pageCount,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.maturityRating,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.imageLinks,
    required this.language,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.industryIdentifiers,
    required this.readingModes,
    required this.panelizationSummary,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      authors: (json['authors'] as List<dynamic>? ?? []).cast<String>(),
      publisher: json['publisher'] ?? '',
      publishedDate: json['publishedDate'] ?? '',
      description: json['description'] ?? '',
      pageCount: json['pageCount'] ?? 0,
      printType: json['printType'] ?? '',
      categories: (json['categories'] as List<dynamic>? ?? []).cast<String>(),
      averageRating: (json['averageRating'] != null)
          ? (json['averageRating'] as num).toDouble()
          : 0.0,
      ratingsCount: json['ratingsCount'] ?? 0,
      maturityRating: json['maturityRating'] ?? '',
      allowAnonLogging: json['allowAnonLogging'] ?? false,
      contentVersion: json['contentVersion'] ?? '',
      imageLinks: ImageLinks.fromJson(json['imageLinks'] ?? {}),
      language: json['language'] ?? '',
      previewLink: json['previewLink'] ?? '',
      infoLink: json['infoLink'] ?? '',
      canonicalVolumeLink: json['canonicalVolumeLink'] ?? '',
      industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>? ?? [])
          .map((e) => IndustryIdentifier.fromJson(e))
          .toList(),
      readingModes: ReadingModes.fromJson(json['readingModes'] ?? {}),
      panelizationSummary: PanelizationSummary.fromJson(
        json['panelizationSummary'] ?? {},
      ),
    );
  }
}

class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({required this.type, required this.identifier});

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'] ?? '',
      identifier: json['identifier'] ?? '',
    );
  }
}

class ReadingModes {
  final bool text;
  final bool image;

  ReadingModes({required this.text, required this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) {
    return ReadingModes(
      text: json['text'] ?? false,
      image: json['image'] ?? false,
    );
  }
}

class PanelizationSummary {
  final bool containsEpubBubbles;
  final bool containsImageBubbles;

  PanelizationSummary({
    required this.containsEpubBubbles,
    required this.containsImageBubbles,
  });

  factory PanelizationSummary.fromJson(Map<String, dynamic> json) {
    return PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'] ?? false,
      containsImageBubbles: json['containsImageBubbles'] ?? false,
    );
  }
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    String fixUrl(String? url) {
      if (url == null) return '';
      return url.replaceAll("http://", "https://");
    }

    return ImageLinks(
      smallThumbnail: fixUrl(json['smallThumbnail']),
      thumbnail: fixUrl(json['thumbnail']),
    );
  }

}

class SaleInfo {
  final String country;
  final String saleability;
  final bool isEbook;

  SaleInfo({
    required this.country,
    required this.saleability,
    required this.isEbook,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) {
    return SaleInfo(
      country: json['country'] ?? '',
      saleability: json['saleability'] ?? '',
      isEbook: json['isEbook'] ?? false,
    );
  }
}

class AccessInfo {
  final String country;
  final String viewability;
  final bool embeddable;
  final bool publicDomain;
  final String textToSpeechPermission;
  final Epub epub;
  final Pdf pdf;
  final String webReaderLink;
  final String accessViewStatus;
  final bool quoteSharingAllowed;

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

  factory AccessInfo.fromJson(Map<String, dynamic> json) {
    return AccessInfo(
      country: json['country'] ?? '',
      viewability: json['viewability'] ?? '',
      embeddable: json['embeddable'] ?? false,
      publicDomain: json['publicDomain'] ?? false,
      textToSpeechPermission: json['textToSpeechPermission'] ?? '',
      epub: Epub.fromJson(json['epub'] ?? {}),
      pdf: Pdf.fromJson(json['pdf'] ?? {}),
      webReaderLink: json['webReaderLink'] ?? '',
      accessViewStatus: json['accessViewStatus'] ?? '',
      quoteSharingAllowed: json['quoteSharingAllowed'] ?? false,
    );
  }
}

class Epub {
  final bool isAvailable;

  Epub({required this.isAvailable});

  factory Epub.fromJson(Map<String, dynamic> json) {
    return Epub(isAvailable: json['isAvailable'] ?? false);
  }
}

class Pdf {
  final bool isAvailable;

  Pdf({required this.isAvailable});

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(isAvailable: json['isAvailable'] ?? false);
  }
}
