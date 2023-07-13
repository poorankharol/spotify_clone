import 'dart:convert';

SongList songListFromMap(String str) => SongList.fromMap(json.decode(str));

String songListToMap(SongList data) => json.encode(data.toMap());

class SongList {
  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  String? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  List<ListElement?>? list;
  SongListMoreInfo? moreInfo;
  //Modules? modules;

  SongList({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
    //this.modules,
  });

  factory SongList.fromMap(Map<String, dynamic> json) => SongList(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    headerDesc: json["header_desc"],
    type: json["type"],
    permaUrl: json["perma_url"],
    image: json["image"],
    language: json["language"],
    year: json["year"],
    playCount: json["play_count"],
    explicitContent: json["explicit_content"],
    listCount: json["list_count"],
    listType: json["list_type"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromMap(x))),
    moreInfo: SongListMoreInfo.fromMap(json["more_info"]),
    //modules: Modules.fromMap(json["modules"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "header_desc": headerDesc,
    "type": type,
    "perma_url": permaUrl,
    "image": image,
    "language": language,
    "year": year,
    "play_count": playCount,
    "explicit_content": explicitContent,
    "list_count": listCount,
    "list_type": listType,
    "list": List<dynamic>.from(list!.map((x) => x!.toMap())),
    "more_info": moreInfo!.toMap(),
    //"modules": modules!.toMap(),
  };
}

class ListElement {
  String? id;
  String? title;
  String? subtitle;
  String? headerDesc;
  String? type;
  String? permaUrl;
  String? image;
  String? language;
  String? year;
  String? playCount;
  String? explicitContent;
  String? listCount;
  String? listType;
  String? list;
  ListMoreInfo? moreInfo;

  ListElement({
    this.id,
    this.title,
    this.subtitle,
    this.headerDesc,
    this.type,
    this.permaUrl,
    this.image,
    this.language,
    this.year,
    this.playCount,
    this.explicitContent,
    this.listCount,
    this.listType,
    this.list,
    this.moreInfo,
  });

  factory ListElement.fromMap(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    headerDesc: json["header_desc"],
    type: json["type"],
    permaUrl: json["perma_url"],
    image: json["image"],
    language: json["language"],
    year: json["year"],
    playCount: json["play_count"],
    explicitContent: json["explicit_content"],
    listCount: json["list_count"],
    listType: json["list_type"],
    list: json["list"],
    moreInfo: ListMoreInfo.fromMap(json["more_info"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "header_desc": headerDesc,
    "type": type,
    "perma_url": permaUrl,
    "image": image,
    "language": language,
    "year": year,
    "play_count": playCount,
    "explicit_content": explicitContent,
    "list_count": listCount,
    "list_type": listType,
    "list": list,
    "more_info": moreInfo!.toMap(),
  };
}

class ListMoreInfo {
  String? music;
  String? albumId;
  String? album;
  String? label;
  String? origin;
  bool? isDolbyContent;
  String? the320Kbps;
  String? encryptedMediaUrl;
  String? encryptedCacheUrl;
  String? albumUrl;
  String? duration;
  Rights? rights;
  String? cacheState;
  String? hasLyrics;
  String? lyricsSnippet;
  String? starred;
  String? copyrightText;
  ArtistMap? artistMap;
  DateTime? releaseDate;
  String? labelUrl;
  bool? trillerAvailable;
  bool? requestJiotuneFlag;
  String? webp;
  String? lyricsId;

  ListMoreInfo({
    this.music,
    this.albumId,
    this.album,
    this.label,
    this.origin,
    this.isDolbyContent,
    this.the320Kbps,
    this.encryptedMediaUrl,
    this.encryptedCacheUrl,
    this.albumUrl,
    this.duration,
    this.rights,
    this.cacheState,
    this.hasLyrics,
    this.lyricsSnippet,
    this.starred,
    this.copyrightText,
    this.artistMap,
    this.releaseDate,
    this.labelUrl,
    this.trillerAvailable,
    this.requestJiotuneFlag,
    this.webp,
    this.lyricsId,
  });

  factory ListMoreInfo.fromMap(Map<String, dynamic> json) => ListMoreInfo(
    music: json["music"],
    albumId: json["album_id"],
    album: json["album"],
    label: json["label"],
    origin: json["origin"],
    isDolbyContent: json["is_dolby_content"],
    the320Kbps: json["320kbps"],
    encryptedMediaUrl: json["encrypted_media_url"],
    encryptedCacheUrl: json["encrypted_cache_url"],
    albumUrl: json["album_url"],
    duration: json["duration"],
    rights: Rights.fromMap(json["rights"]),
    cacheState: json["cache_state"],
    hasLyrics: json["has_lyrics"],
    lyricsSnippet: json["lyrics_snippet"],
    starred: json["starred"],
    copyrightText: json["copyright_text"],
    artistMap: ArtistMap.fromMap(json["artistMap"]),
    releaseDate: DateTime.parse(json["release_date"]),
    labelUrl: json["label_url"],
    trillerAvailable: json["triller_available"],
    requestJiotuneFlag: json["request_jiotune_flag"],
    webp: json["webp"],
    lyricsId: json["lyrics_id"],
  );

  Map<String, dynamic> toMap() => {
    "music": music,
    "album_id": albumId,
    "album": album,
    "label": label,
    "origin": origin,
    "is_dolby_content": isDolbyContent,
    "320kbps": the320Kbps,
    "encrypted_media_url": encryptedMediaUrl,
    "encrypted_cache_url": encryptedCacheUrl,
    "album_url": albumUrl,
    "duration": duration,
    "rights": rights!.toMap(),
    "cache_state": cacheState,
    "has_lyrics": hasLyrics,
    "lyrics_snippet": lyricsSnippet,
    "starred": starred,
    "copyright_text": copyrightText,
    "artistMap": artistMap!.toMap(),
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "label_url": labelUrl,
    "triller_available": trillerAvailable,
    "request_jiotune_flag": requestJiotuneFlag,
    "webp": webp,
    "lyrics_id": lyricsId,
  };
}

class ArtistMap {
  List<Artist>? primaryArtists;
  List<Artist>? featuredArtists;
  List<Artist>? artists;

  ArtistMap({
    this.primaryArtists,
    this.featuredArtists,
    this.artists,
  });

  factory ArtistMap.fromMap(Map<String, dynamic> json) => ArtistMap(
    primaryArtists: List<Artist>.from(json["primary_artists"].map((x) => Artist.fromMap(x))),
    featuredArtists: List<Artist>.from(json["featured_artists"].map((x) => x)),
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "primary_artists": List<Artist>.from(primaryArtists!.map((x) => x.toMap())),
    "featured_artists": List<Artist>.from(featuredArtists!.map((x) => x)),
    "artists": List<Artist>.from(artists!.map((x) => x.toMap())),
  };
}

class Artist {
  String? id;
  String? name;
  String? role;
  String? image;
  String? type;
  String? permaUrl;

  Artist({
    this.id,
    this.name,
    this.role,
    this.image,
    this.type,
    this.permaUrl,
  });

  factory Artist.fromMap(Map<String, dynamic> json) => Artist(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    image: json["image"],
    type: json["type"],
    permaUrl: json["perma_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "role": role,
    "image": image,
    "type": type,
    "perma_url": permaUrl,
  };
}

class Rights {
  String? code;
  String? cacheable;
  String? deleteCachedObject;
  String? reason;

  Rights({
    this.code,
    this.cacheable,
    this.deleteCachedObject,
    this.reason,
  });

  factory Rights.fromMap(Map<String, dynamic> json) => Rights(
    code: json["code"],
    cacheable: json["cacheable"],
    deleteCachedObject: json["delete_cached_object"],
    reason: json["reason"],
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "cacheable": cacheable,
    "delete_cached_object": deleteCachedObject,
    "reason": reason,
  };
}

class Modules {
  Artists? list;
  Artists? reco;
  Artists? currentlyTrending;
  Artists? topAlbumsFromSameYear;
  Artists? artists;

  Modules({
    this.list,
    this.reco,
    this.currentlyTrending,
    this.topAlbumsFromSameYear,
    this.artists,
  });

  factory Modules.fromMap(Map<String, dynamic> json) => Modules(
    list: Artists.fromMap(json["list"]),
    reco: Artists.fromMap(json["reco"]),
    currentlyTrending: Artists.fromMap(json["currentlyTrending"]),
    topAlbumsFromSameYear: Artists.fromMap(json["topAlbumsFromSameYear"]),
    artists: Artists.fromMap(json["artists"]),
  );

  Map<String, dynamic> toMap() => {
    "list": list!.toMap(),
    "reco": reco!.toMap(),
    "currentlyTrending": currentlyTrending!.toMap(),
    "topAlbumsFromSameYear": topAlbumsFromSameYear!.toMap(),
    "artists": artists!.toMap(),
  };
}

class Artists {
  String? source;
  int? position;
  String? score;
  String? bucket;
  String? scrollType;
  String? title;
  String? subtitle;
  String? highlight;
  bool? simpleHeader;
  bool? noHeader;
  List<dynamic>? viewMore;
  bool? isJtModule;
  bool? sourceApi;
  SourceParams? sourceParams;

  Artists({
    this.source,
    this.position,
    this.score,
    this.bucket,
    this.scrollType,
    this.title,
    this.subtitle,
    this.highlight,
    this.simpleHeader,
    this.noHeader,
    this.viewMore,
    this.isJtModule,
    this.sourceApi,
    this.sourceParams,
  });

  factory Artists.fromMap(Map<String, dynamic> json) => Artists(
    source: json["source"],
    position: json["position"],
    score: json["score"],
    bucket: json["bucket"],
    scrollType: json["scroll_type"],
    title: json["title"],
    subtitle: json["subtitle"],
    highlight: json["highlight"],
    simpleHeader: json["simpleHeader"],
    noHeader: json["noHeader"],
    viewMore: List<dynamic>.from(json["view_more"].map((x) => x)),
    isJtModule: json["is_JT_module"],
    sourceApi: json["source_api"],
    sourceParams: SourceParams.fromMap(json["source_params"]),
  );

  Map<String, dynamic> toMap() => {
    "source": source,
    "position": position,
    "score": score,
    "bucket": bucket,
    "scroll_type": scrollType,
    "title": title,
    "subtitle": subtitle,
    "highlight": highlight,
    "simpleHeader": simpleHeader,
    "noHeader": noHeader,
    "view_more": List<dynamic>.from(viewMore!.map((x) => x)),
    "is_JT_module": isJtModule,
    "source_api": sourceApi,
    "source_params": sourceParams!.toMap(),
  };
}

class SourceParams {
  String? entityType;
  String? entityLanguage;
  String? albumid;
  String? albumYear;
  String? albumLang;

  SourceParams({
    this.entityType,
    this.entityLanguage,
    this.albumid,
    this.albumYear,
    this.albumLang,
  });

  factory SourceParams.fromMap(Map<String, dynamic> json) => SourceParams(
    entityType: json["entity_type"],
    entityLanguage: json["entity_language"],
    albumid: json["albumid"],
    albumYear: json["album_year"],
    albumLang: json["album_lang"],
  );

  Map<String, dynamic> toMap() => {
    "entity_type": entityType,
    "entity_language": entityLanguage,
    "albumid": albumid,
    "album_year": albumYear,
    "album_lang": albumLang,
  };
}

class SongListMoreInfo {
  ArtistMap? artistMap;
  String? songCount;
  String? copyrightText;
  bool? isDolbyContent;
  String? labelUrl;

  SongListMoreInfo({
    this.artistMap,
    this.songCount,
    this.copyrightText,
    this.isDolbyContent,
    this.labelUrl,
  });

  factory SongListMoreInfo.fromMap(Map<String, dynamic> json) => SongListMoreInfo(
    artistMap: ArtistMap.fromMap(json["artistMap"]),
    songCount: json["song_count"],
    copyrightText: json["copyright_text"],
    isDolbyContent: json["is_dolby_content"],
    labelUrl: json["label_url"],
  );

  Map<String, dynamic> toMap() => {
    "artistMap": artistMap!.toMap(),
    "song_count": songCount,
    "copyright_text": copyrightText,
    "is_dolby_content": isDolbyContent,
    "label_url": labelUrl,
  };
}
