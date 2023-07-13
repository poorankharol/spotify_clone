// To parse this JSON data, do
//
//     final homeData = homeDataFromMap(jsonString);

import 'dart:convert';

HomeData homeDataFromMap(String str) => HomeData.fromMap(json.decode(str));

String homeDataToMap(HomeData data) => json.encode(data.toMap());

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
class HomeData {
  List<NewTrending>? newTrending;
  List<TopPlaylist?>? topPlaylists;
  List<NewAlbum?>? newAlbums;
  List<BrowseDiscover?>? browseDiscover;
  List<Chart?>? charts;
  List<Radio?>? radio;
  List<ArtistReco?>? artistRecos;
  List<CityMod?>? cityMod;
  Modules? modules;

  HomeData({
    this.newTrending,
    this.topPlaylists,
    this.newAlbums,
    this.browseDiscover,
    this.charts,
    this.radio,
    this.artistRecos,
    this.cityMod,
    this.modules,
  });

  factory HomeData.fromMap(Map<String, dynamic> json) => HomeData(
    newTrending: List<NewTrending>.from(json["new_trending"].map((x) => NewTrending.fromMap(x))),
    topPlaylists: List<TopPlaylist>.from(json["top_playlists"].map((x) => TopPlaylist.fromMap(x))),
    newAlbums: List<NewAlbum>.from(json["new_albums"].map((x) => NewAlbum.fromMap(x))),
    browseDiscover: List<BrowseDiscover>.from(json["browse_discover"].map((x) => BrowseDiscover.fromMap(x))),
    charts: List<Chart>.from(json["charts"].map((x) => Chart.fromMap(x))),
    radio: List<Radio>.from(json["radio"].map((x) => Radio.fromMap(x))),
    artistRecos: List<ArtistReco>.from(json["artist_recos"].map((x) => ArtistReco.fromMap(x))),
    cityMod: List<CityMod>.from(json["city_mod"].map((x) => CityMod.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "new_trending": List<dynamic>.from(newTrending!.map((x) => x.toMap())),
    "top_playlists": List<dynamic>.from(topPlaylists!.map((x) => x!.toMap())),
    "new_albums": List<dynamic>.from(newAlbums!.map((x) => x!.toMap())),
    "browse_discover": List<dynamic>.from(browseDiscover!.map((x) => x!.toMap())),
    "charts": List<dynamic>.from(charts!.map((x) => x!.toMap())),
    "radio": List<dynamic>.from(radio!.map((x) => x!.toMap())),
    "artist_recos": List<dynamic>.from(artistRecos!.map((x) => x!.toMap())),
    "city_mod": List<dynamic>.from(cityMod!.map((x) => x!.toMap())),
  };
}

class ArtistReco {
  String? id;
  String? title;
  String? subtitle;
  String? type;
  String? image;
  String? permaUrl;
  ArtistRecoMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  ArtistReco({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  factory ArtistReco.fromMap(Map<String, dynamic> json) => ArtistReco(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    type: json["type"],
    image: json["image"],
    permaUrl: json["perma_url"],
    moreInfo: ArtistRecoMoreInfo.fromMap(json["more_info"]),
    explicitContent: json["explicit_content"],
    miniObj: json["mini_obj"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "type": type,
    "image": image,
    "perma_url": permaUrl,
    "more_info": moreInfo!.toMap(),
    "explicit_content": explicitContent,
    "mini_obj": miniObj,
  };
}

class ArtistRecoMoreInfo {
  String featuredStationType;
  String query;
  String stationDisplayText;

  ArtistRecoMoreInfo({
    required this.featuredStationType,
    required this.query,
    required this.stationDisplayText,
  });

  factory ArtistRecoMoreInfo.fromMap(Map<String, dynamic> json) => ArtistRecoMoreInfo(
    featuredStationType: json["featured_station_type"],
    query: json["query"],
    stationDisplayText: json["station_display_text"],
  );

  Map<String, dynamic> toMap() => {
    "featured_station_type": featuredStationType,
    "query": query,
    "station_display_text": stationDisplayText,
  };
}


class BrowseDiscover {
  String? id;
  String? title;
  String? subtitle;
  String? type;
  String? image;
  String? permaUrl;
  BrowseDiscoverMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  BrowseDiscover({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  factory BrowseDiscover.fromMap(Map<String, dynamic> json) => BrowseDiscover(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    type: json["type"],
    image: json["image"],
    permaUrl: json["perma_url"],
    moreInfo: json['more_info'] != null ? BrowseDiscoverMoreInfo?.fromMap(json['more_info']) : null,
    explicitContent: json["explicit_content"],
    miniObj: json["mini_obj"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "type": type,
    "image": image,
    "perma_url": permaUrl,
    "more_info": moreInfo!.toMap(),
    "explicit_content": explicitContent,
    "mini_obj": miniObj,
  };
}

class BrowseDiscoverMoreInfo {
  String? badge;
  String? subType;
  String? available;
  String? isFeatured;
  //Tags? tags;
  String? videoUrl;
  String? videoThumbnail;

  BrowseDiscoverMoreInfo({
    this.badge,
    this.subType,
    this.available,
    this.isFeatured,
    //this.tags,
    this.videoUrl,
    this.videoThumbnail,
  });

  factory BrowseDiscoverMoreInfo.fromMap(Map<String, dynamic> json) => BrowseDiscoverMoreInfo(
    badge: json["badge"],
    subType:json["sub_type"],
    available: json["available"],
    isFeatured: json["is_featured"],
    //tags: Tags.fromMap(json["tags"]),
    videoUrl: json["video_url"],
    videoThumbnail: json["video_thumbnail"],
  );

  Map<String, dynamic> toMap() => {
    "badge": badge,
    "sub_type": subType,
    "available": available,
    "is_featured": isFeatured,
    //"tags": tags!.toMap(),
    "video_url": videoUrl,
    "video_thumbnail": videoThumbnail,
  };
}

class Tags {
  List<String>? situation;
  List<String>? mood;
  List<String>? seasonality;
  List<String>? genre;

  Tags({
    this.situation,
    this.mood,
    this.seasonality,
    this.genre,
  });

  factory Tags.fromMap(Map<String, dynamic> json) => Tags(
    situation: json["situation"] == null ? [] : List<String>.from(json["situation"]!.map((x) => x)),
    mood: json["mood"] == null ? [] : List<String>.from(json["mood"]!.map((x) => x)),
    seasonality: json["seasonality"] == null ? [] : List<String>.from(json["seasonality"]!.map((x) => x)),
    genre: json["genre"] == null ? [] : List<String>.from(json["genre"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "situation": situation == null ? [] : List<dynamic>.from(situation!.map((x) => x)),
    "mood": mood == null ? [] : List<dynamic>.from(mood!.map((x) => x)),
    "seasonality": seasonality == null ? [] : List<dynamic>.from(seasonality!.map((x) => x)),
    "genre": genre == null ? [] : List<dynamic>.from(genre!.map((x) => x)),
  };
}


class Chart {
  String? id;
  String? image;
  String? title;
  String? type;
  int? count;
  String? permaUrl;
  String? listname;
  ChartMoreInfo? moreInfo;
  String? subtitle;
  String? explicitContent;
  bool? miniObj;
  String? language;

  Chart({
    this.id,
    this.image,
    this.title,
    this.type,
    this.count,
    this.permaUrl,
    this.listname,
    this.moreInfo,
    this.subtitle,
    this.explicitContent,
    this.miniObj,
    this.language,
  });

  factory Chart.fromMap(Map<String, dynamic> json) => Chart(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    type: json["type"],
    count: json["count"],
    permaUrl: json["perma_url"],
    listname: json["listname"],
    moreInfo: json["more_info"] == null ? null : ChartMoreInfo.fromMap(json["more_info"]),
    subtitle: json["subtitle"],
    explicitContent: json["explicit_content"],
    miniObj: json["mini_obj"],
    language: json["language"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "title": title,
    "type": type,
    "count": count,
    "perma_url": permaUrl,
    "listname": listname,
    "more_info": moreInfo?.toMap(),
    "subtitle": subtitle,
    "explicit_content": explicitContent,
    "mini_obj": miniObj,
    "language": language,
  };
}


class ChartMoreInfo {
  int? songCount;
  String? firstname;

  ChartMoreInfo({
    this.songCount,
    this.firstname,
  });

  factory ChartMoreInfo.fromMap(Map<String, dynamic> json) => ChartMoreInfo(
    songCount: json["song_count"],
    firstname: json["firstname"],
  );

  Map<String, dynamic> toMap() => {
    "song_count": songCount,
    "firstname": firstname,
  };
}

class CityMod {
  String? id;
  String? title;
  String? subtitle;
  String? type;
  String? image;
  String? permaUrl;
  CityModMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  CityMod({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  factory CityMod.fromMap(Map<String, dynamic> json) => CityMod(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    type: json["type"],
    image: json["image"],
    permaUrl: json["perma_url"],
    moreInfo: CityModMoreInfo.fromMap(json["more_info"]),
    explicitContent: json["explicit_content"],
    miniObj: json["mini_obj"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "type": type,
    "image": image,
    "perma_url": permaUrl,
    "more_info": moreInfo!.toMap(),
    "explicit_content": explicitContent,
    "mini_obj": miniObj,
  };
}

class CityModMoreInfo {
  String? featuredStationType;
  String? query;
  dynamic videoAvailable;
  dynamic subTypes;
  String? albumId;
  List<MultipleTune>? multipleTunes;

  CityModMoreInfo({
    this.featuredStationType,
    this.query,
    this.videoAvailable,
    this.subTypes,
    this.albumId,
    this.multipleTunes,
  });

  factory CityModMoreInfo.fromMap(Map<String, dynamic> json) => CityModMoreInfo(
    featuredStationType: json["featured_station_type"],
    query: json["query"],
    videoAvailable: json["video_available"],
    subTypes: json["sub_types"],
    albumId: json["album_id"],
    multipleTunes: json["multiple_tunes"] == null ? [] : List<MultipleTune>.from(json["multiple_tunes"]!.map((x) => MultipleTune.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "featured_station_type":featuredStationType,
    "query": query,
    "video_available": videoAvailable,
    "sub_types": subTypes,
    "album_id": albumId,
    "multiple_tunes": multipleTunes == null ? [] : List<dynamic>.from(multipleTunes!.map((x) => x.toMap())),
  };
}

class MultipleTune {
  String? id;
  String? title;
  String? type;
  String? subtype;
  String? vcode;
  String? vlink;

  MultipleTune({
    this.id,
    this.title,
    this.type,
    this.subtype,
    this.vcode,
    this.vlink,
  });

  factory MultipleTune.fromMap(Map<String, dynamic> json) => MultipleTune(
    id: json["id"],
    title: json["title"],
    type: json["type"],
    subtype: json["subtype"],
    vcode: json["vcode"],
    vlink: json["vlink"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "type": type,
    "subtype": subtype,
    "vcode": vcode,
    "vlink": vlink,
  };
}

class NewAlbum {
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
  NewAlbumMoreInfo? moreInfo;

  NewAlbum({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.headerDesc,
    required this.type,
    required this.permaUrl,
    required this.image,
    required this.language,
    required this.year,
    required this.playCount,
    required this.explicitContent,
    required this.listCount,
    required this.listType,
    required this.list,
    required this.moreInfo,
  });

  factory NewAlbum.fromMap(Map<String, dynamic> json) => NewAlbum(
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
    moreInfo: NewAlbumMoreInfo.fromMap(json["more_info"]),
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

class NewAlbumMoreInfo {
  String? songCount;
  DateTime? releaseDate;
  ArtistMap? artistMap;

  NewAlbumMoreInfo({
    required this.songCount,
    required this.releaseDate,
    required this.artistMap,
  });

  factory NewAlbumMoreInfo.fromMap(Map<String, dynamic> json) => NewAlbumMoreInfo(
    songCount: json["song_count"],
    releaseDate: DateTime.parse(json["release_date"]),
    artistMap: ArtistMap.fromMap(json["artistMap"]),
  );

  Map<String, dynamic> toMap() => {
    "song_count": songCount,
    "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "artistMap": artistMap!.toMap(),
  };
}

class ArtistMap {
  List<Artist?>? primaryArtists;
  List<dynamic> featuredArtists;
  List<Artist> artists;

  ArtistMap({
    required this.primaryArtists,
    required this.featuredArtists,
    required this.artists,
  });

  factory ArtistMap.fromMap(Map<String, dynamic> json) => ArtistMap(
    primaryArtists: List<Artist>.from(json["primary_artists"].map((x) => Artist.fromMap(x))),
    featuredArtists: List<dynamic>.from(json["featured_artists"].map((x) => x)),
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "primary_artists": List<dynamic>.from(primaryArtists!.map((x) => x!.toMap())),
    "featured_artists": List<dynamic>.from(featuredArtists.map((x) => x)),
    "artists": List<dynamic>.from(artists.map((x) => x.toMap())),
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

class NewTrending {
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
  NewTrendingMoreInfo? moreInfo;

  NewTrending({
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

  factory NewTrending.fromMap(Map<String, dynamic> json) => NewTrending(
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
    moreInfo: NewTrendingMoreInfo.fromMap(json["more_info"]),
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

class NewTrendingMoreInfo {
  String? isWeekly;
  String? firstname;
  String? songCount;
  String? followerCount;
  String? fanCount;
  String? releaseDate;
  ArtistMap? artistMap;
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
  String? labelUrl;
  String? vcode;
  String? vlink;
  bool? trillerAvailable;
  bool? requestJiotuneFlag;
  String? webp;
  String? lyricsId;

  NewTrendingMoreInfo({
    this.isWeekly,
    this.firstname,
    this.songCount,
    this.followerCount,
    this.fanCount,
    this.releaseDate,
    this.artistMap,
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
    this.labelUrl,
    this.vcode,
    this.vlink,
    this.trillerAvailable,
    this.requestJiotuneFlag,
    this.webp,
    this.lyricsId,
  });

  factory NewTrendingMoreInfo.fromMap(Map<String, dynamic> json) => NewTrendingMoreInfo(
    isWeekly: json["isWeekly"],
    firstname: json["firstname"],
    songCount: json["song_count"],
    followerCount: json["follower_count"],
    fanCount: json["fan_count"],
    releaseDate: json["release_date"],
    artistMap: json["artistMap"] == null ? null : ArtistMap.fromMap(json["artistMap"]),
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
    rights: json["rights"] == null ? null : Rights.fromMap(json["rights"]),
    cacheState: json["cache_state"],
    hasLyrics: json["has_lyrics"],
    lyricsSnippet: json["lyrics_snippet"],
    starred: json["starred"],
    copyrightText: json["copyright_text"],
    labelUrl: json["label_url"],
    vcode: json["vcode"],
    vlink: json["vlink"],
    trillerAvailable: json["triller_available"],
    requestJiotuneFlag: json["request_jiotune_flag"],
    webp: json["webp"],
    lyricsId: json["lyrics_id"],
  );

  Map<String, dynamic> toMap() => {
    "isWeekly": isWeekly,
    "firstname": firstname,
    "song_count": songCount,
    "follower_count": followerCount,
    "fan_count": fanCount,
    "release_date": releaseDate,
    "artistMap": artistMap?.toMap(),
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
    "rights": rights?.toMap(),
    "cache_state": cacheState,
    "has_lyrics": hasLyrics,
    "lyrics_snippet": lyricsSnippet,
    "starred": starred,
    "copyright_text": copyrightText,
    "label_url": labelUrl,
    "vcode": vcode,
    "vlink": vlink,
    "triller_available": trillerAvailable,
    "request_jiotune_flag": requestJiotuneFlag,
    "webp": webp,
    "lyrics_id": lyricsId,
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

class Radio {
  String? id;
  String? title;
  String? subtitle;
  String? type;
  String? image;
  String? permaUrl;
  RadioMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  Radio({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  factory Radio.fromMap(Map<String, dynamic> json) => Radio(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    type:json["type"],
    image: json["image"],
    permaUrl: json["perma_url"],
    moreInfo: RadioMoreInfo.fromMap(json["more_info"]),
    explicitContent: json["explicit_content"],
    miniObj: json["mini_obj"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "type": type,
    "image": image,
    "perma_url": permaUrl,
    "more_info": moreInfo!.toMap(),
    "explicit_content": explicitContent,
    "mini_obj": miniObj,
  };
}

class RadioMoreInfo {
  dynamic description;
  String? featuredStationType;
  String? query;
  dynamic color;
  String? language;
  String? stationDisplayText;

  RadioMoreInfo({
    this.description,
    this.featuredStationType,
    this.query,
    this.color,
     this.language,
     this.stationDisplayText,
  });

  factory RadioMoreInfo.fromMap(Map<String, dynamic> json) => RadioMoreInfo(
    description: json["description"],
    featuredStationType:json["featured_station_type"],
    query: json["query"],
    color: json["color"],
    language: json["language"],
    stationDisplayText: json["station_display_text"],
  );

  Map<String, dynamic> toMap() => {
    "description": description,
    "featured_station_type": featuredStationType,
    "query": query,
    "color": color,
    "language": language,
    "station_display_text": stationDisplayText,
  };
}

class TopPlaylist {
  String? id;
  String? title;
  String? subtitle;
  String? type;
  String? image;
  String? permaUrl;
  TopPlaylistMoreInfo? moreInfo;
  String? explicitContent;
  bool? miniObj;

  TopPlaylist({
    this.id,
    this.title,
    this.subtitle,
    this.type,
    this.image,
    this.permaUrl,
    this.moreInfo,
    this.explicitContent,
    this.miniObj,
  });

  factory TopPlaylist.fromMap(Map<String, dynamic> json) => TopPlaylist(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    type:json["type"],
    image: json["image"],
    permaUrl: json["perma_url"],
    moreInfo: TopPlaylistMoreInfo.fromMap(json["more_info"]),
    explicitContent: json["explicit_content"],
    miniObj: json["mini_obj"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "type": type,
    "image": image,
    "perma_url": permaUrl,
    "more_info": moreInfo!.toMap(),
    "explicit_content": explicitContent,
    "mini_obj": miniObj,
  };
}

class TopPlaylistMoreInfo {
  String? songCount;
  String? firstname;
  String? followerCount;
  String? lastUpdated;
  String? uid;

  TopPlaylistMoreInfo({
    required this.songCount,
    required this.firstname,
    required this.followerCount,
    required this.lastUpdated,
    required this.uid,
  });

  factory TopPlaylistMoreInfo.fromMap(Map<String, dynamic> json) => TopPlaylistMoreInfo(
    songCount: json["song_count"],
    firstname: json["firstname"],
    followerCount: json["follower_count"],
    lastUpdated: json["last_updated"],
    uid: json["uid"],
  );

  Map<String, dynamic> toMap() => {
    "song_count": songCount,
    "firstname": firstname,
    "follower_count": followerCount,
    "last_updated": lastUpdated,
    "uid": uid,
  };
}

class Modules{
  String? source;
  int? position;
  String? score;
  String? bucket;
  String? scrolltype;
  String? title;
  String? subtitle;
  String? highlight;
  bool? simpleHeader;
  bool? noHeader;
  ViewMore? viewmore;
  bool? isJTmodule;

  Modules({this.source, this.position, this.score, this.bucket, this.scrolltype, this.title, this.subtitle, this.highlight, this.simpleHeader, this.noHeader, this.viewmore, this.isJTmodule});

  Modules.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    position = json['position'];
    score = json['score'];
    bucket = json['bucket'];
    scrolltype = json['scroll_type'];
    title = json['title'];
    subtitle = json['subtitle'];
    highlight = json['highlight'];
    simpleHeader = json['simpleHeader'];
    noHeader = json['noHeader'];
    viewmore = json['view_more'] != null ? ViewMore?.fromJson(json['view_more']) : null;
    isJTmodule = json['is_JT_module'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source'] = source;
    data['position'] = position;
    data['score'] = score;
    data['bucket'] = bucket;
    data['scroll_type'] = scrolltype;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['highlight'] = highlight;
    data['simpleHeader'] = simpleHeader;
    data['noHeader'] = noHeader;
    data['view_more'] = viewmore!.toJson();
    data['is_JT_module'] = isJTmodule;
    return data;
  }
}
class ViewMore {
  String? api;
  String? pageparam;
  String? sizeparam;
  int? defaultsize;
  String? scrolltype;

  ViewMore({this.api, this.pageparam, this.sizeparam, this.defaultsize, this.scrolltype});

  ViewMore.fromJson(Map<String, dynamic> json) {
    api = json['api'];
    pageparam = json['page_param'];
    sizeparam = json['size_param'];
    defaultsize = json['default_size'];
    scrolltype = json['scroll_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api'] = api;
    data['page_param'] = pageparam;
    data['size_param'] = sizeparam;
    data['default_size'] = defaultsize;
    data['scroll_type'] = scrolltype;
    return data;
  }
}


