import 'package:flutter/material.dart';

class SectionBuilder extends StatelessWidget {
  const SectionBuilder({
    super.key,
    required this.sectionTitle,
    required this.sectionBodyBuilder,
    this.titlePadding = const EdgeInsets.only(left: 0, bottom: 18),
    this.padding = const EdgeInsets.only(bottom: 0),
  });

  final String sectionTitle;
  final Widget Function(BuildContext) sectionBodyBuilder;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: titlePadding,
            child: Text(
              sectionTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
          ),
          Builder(builder: sectionBodyBuilder),
        ],
      ),
    );
  }
}
