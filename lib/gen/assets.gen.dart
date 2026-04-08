// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/account_header.png
  AssetGenImage get accountHeader =>
      const AssetGenImage('assets/images/account_header.png');

  /// File path: assets/images/actionbar_search.png
  AssetGenImage get actionbarSearch =>
      const AssetGenImage('assets/images/actionbar_search.png');

  /// File path: assets/images/aliuser_title_back_normal.9.png
  AssetGenImage get aliuserTitleBackNormal9 =>
      const AssetGenImage('assets/images/aliuser_title_back_normal.9.png');

  /// File path: assets/images/boy.png
  AssetGenImage get boy => const AssetGenImage('assets/images/boy.png');

  /// File path: assets/images/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/images/ic_launcher.png');

  /// File path: assets/images/ic_playing.png
  AssetGenImage get icPlaying =>
      const AssetGenImage('assets/images/ic_playing.png');

  /// File path: assets/images/icons-facebook.png
  AssetGenImage get iconsFacebook =>
      const AssetGenImage('assets/images/icons-facebook.png');

  /// File path: assets/images/icons-google.png
  AssetGenImage get iconsGoogle =>
      const AssetGenImage('assets/images/icons-google.png');

  /// File path: assets/images/icons-twitter.png
  AssetGenImage get iconsTwitter =>
      const AssetGenImage('assets/images/icons-twitter.png');

  /// File path: assets/images/love.jpeg
  AssetGenImage get love => const AssetGenImage('assets/images/love.jpeg');

  /// File path: assets/images/man.png
  AssetGenImage get man => const AssetGenImage('assets/images/man.png');

  /// File path: assets/images/reading.png
  AssetGenImage get reading => const AssetGenImage('assets/images/reading.png');

  /// File path: assets/images/video_icon_praise.png
  AssetGenImage get videoIconPraise =>
      const AssetGenImage('assets/images/video_icon_praise.png');

  /// File path: assets/images/video_msg_icon.png
  AssetGenImage get videoMsgIcon =>
      const AssetGenImage('assets/images/video_msg_icon.png');

  /// File path: assets/images/video_share_icon.png
  AssetGenImage get videoShareIcon =>
      const AssetGenImage('assets/images/video_share_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    accountHeader,
    actionbarSearch,
    aliuserTitleBackNormal9,
    boy,
    icLauncher,
    icPlaying,
    iconsFacebook,
    iconsGoogle,
    iconsTwitter,
    love,
    man,
    reading,
    videoIconPraise,
    videoMsgIcon,
    videoShareIcon,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
