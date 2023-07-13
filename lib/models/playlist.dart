// To parse this JSON data, do
//
//     final playList = playListFromMap(jsonString);

import 'dart:convert';

import 'package:spotify_clone/models/song_list.dart';

PlayList playListFromMap(String str) => PlayList.fromMap(json.decode(str));

String playListToMap(PlayList data) => json.encode(data.toMap());

class PlayList {
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
  PlayListMoreInfo? moreInfo;
  //Modules modules;

  PlayList({
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

  factory PlayList.fromMap(Map<String, dynamic> json) => PlayList(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    headerDesc: json["header_desc"],
    type:json["type"],
    permaUrl: json["perma_url"],
    image: json["image"],
    language: json["language"],
    year: json["year"],
    playCount: json["play_count"],
    explicitContent: json["explicit_content"],
    listCount: json["list_count"],
    listType: json["list_type"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromMap(x))),
    moreInfo: PlayListMoreInfo.fromMap(json["more_info"]),
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
    featuredArtists: List<Artist>.from(json["featured_artists"].map((x) => Artist.fromMap(x))),
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "primary_artists": List<dynamic>.from(primaryArtists!.map((x) => x.toMap())),
    "featured_artists": List<dynamic>.from(featuredArtists!.map((x) => x.toMap())),
    "artists": List<dynamic>.from(artists!.map((x) => x.toMap())),
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
  Artists? relatedPlaylist;
  Artists? currentlyTrendingPlaylists;
  Artists? artists;

  Modules({
    this.list,
    this.relatedPlaylist,
    this.currentlyTrendingPlaylists,
    this.artists,
  });

  factory Modules.fromMap(Map<String, dynamic> json) => Modules(
    list: Artists.fromMap(json["list"]),
    relatedPlaylist: Artists.fromMap(json["relatedPlaylist"]),
    currentlyTrendingPlaylists: Artists.fromMap(json["currentlyTrendingPlaylists"]),
    artists: Artists.fromMap(json["artists"]),
  );

  Map<String, dynamic> toMap() => {
    "list": list!.toMap(),
    "relatedPlaylist": relatedPlaylist!.toMap(),
    "currentlyTrendingPlaylists": currentlyTrendingPlaylists!.toMap(),
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
  String? listid;

  SourceParams({
    this.entityType,
    this.entityLanguage,
    this.listid,
  });

  factory SourceParams.fromMap(Map<String, dynamic> json) => SourceParams(
    entityType: json["entity_type"],
    entityLanguage: json["entity_language"],
    listid: json["listid"],
  );

  Map<String, dynamic> toMap() => {
    "entity_type": entityType,
    "entity_language": entityLanguage,
    "listid": listid,
  };
}

class PlayListMoreInfo {
  String? uid;
  bool? isDolbyContent;
  List<dynamic>? subtype;
  String? lastUpdated;
  String? username;
  String? firstname;
  String? lastname;
  String? isFollowed;
  bool? isFy;
  String? followerCount;
  String? fanCount;
  String? playlistType;
  String? share;
  List<dynamic>? subTypes;
  List<dynamic>? images;
  String? h2;
  String? subheading;
  String? videoCount;
  List<Artist>? artists;
  List<String>? subtitleDesc;

  PlayListMoreInfo({
    this.uid,
    this.isDolbyContent,
    this.subtype,
    this.lastUpdated,
    this.username,
    this.firstname,
    this.lastname,
    this.isFollowed,
    this.isFy,
    this.followerCount,
    this.fanCount,
    this.playlistType,
    this.share,
    this.subTypes,
    this.images,
    this.h2,
    this.subheading,
    this.videoCount,
    this.artists,
    this.subtitleDesc,
  });

  factory PlayListMoreInfo.fromMap(Map<String, dynamic> json) => PlayListMoreInfo(
    uid: json["uid"],
    isDolbyContent: json["is_dolby_content"],
    subtype: List<dynamic>.from(json["subtype"].map((x) => x)),
    lastUpdated: json["last_updated"],
    username: json["username"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    isFollowed: json["is_followed"],
    isFy: json["isFY"],
    followerCount: json["follower_count"],
    fanCount: json["fan_count"],
    playlistType: json["playlist_type"],
    share: json["share"],
    subTypes: List<dynamic>.from(json["sub_types"].map((x) => x)),
    images: List<dynamic>.from(json["images"].map((x) => x)),
    h2: json["H2"],
    subheading: json["subheading"],
    videoCount: json["video_count"],
    artists: List<Artist>.from(json["artists"].map((x) => Artist.fromMap(x))),
    subtitleDesc: List<String>.from(json["subtitle_desc"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "is_dolby_content": isDolbyContent,
    "subtype": List<dynamic>.from(subtype!.map((x) => x)),
    "last_updated": lastUpdated,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
    "is_followed": isFollowed,
    "isFY": isFy,
    "follower_count": followerCount,
    "fan_count": fanCount,
    "playlist_type": playlistType,
    "share": share,
    "sub_types": List<dynamic>.from(subTypes!.map((x) => x)),
    "images": List<dynamic>.from(images!.map((x) => x)),
    "H2": h2,
    "subheading": subheading,
    "video_count": videoCount,
    "artists": List<dynamic>.from(artists!.map((x) => x.toMap())),
    "subtitle_desc": List<dynamic>.from(subtitleDesc!.map((x) => x)),
  };
}

